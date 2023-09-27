import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quick_meet/data/enum.dart';
import 'package:quick_meet/data/models/auth_controller/auth_login_response.dart' as alr;
import 'package:quick_meet/data/models/auth_controller/auth_refresh_token_response.dart';
import 'package:quick_meet/data/models/user_controller/user_get_id_response.dart';
import 'package:quick_meet/data/network/api/activation_code_api.dart';
import 'package:quick_meet/data/network/api/auth_api.dart';
import 'package:quick_meet/data/network/api/user_api.dart';
import 'package:quick_meet/data/network/dio_client.dart';
import 'package:quick_meet/data/storage/pref_storage.dart';
import 'package:quick_meet/domain/repository/activation_code_repository.dart';
import 'package:quick_meet/domain/repository/auth_repository.dart';
import 'package:quick_meet/domain/repository/home_repository.dart';
import 'package:quick_meet/domain/repository/user_repository.dart';

final getIt = GetIt.instance;

Future<bool> setup(StreamController<GlobalEvents> gs) async {
  await PrefStorageInstance.load();

  final storage = PrefStorage();
  getIt.registerSingleton<PrefStorage>(
    storage,
  );

  getIt.registerSingleton<Dio>(Dio()
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90)));
  getIt.registerSingleton<DioClient>(DioClient(getIt<Dio>()));

  getIt.registerSingleton(ActivationCodeApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(
      ActivationCodeRepository(activationCodeApi: getIt.get<ActivationCodeApi>()));

  getIt.registerSingleton(AuthApi(dioClient: getIt<DioClient>()));
  var authRepo = getIt.registerSingleton(AuthRepository(authApi: getIt.get<AuthApi>()));

  getIt.registerSingleton(UserApi(dioClient: getIt<DioClient>()));
  var userRepo = getIt.registerSingleton(UserRepository(userApi: getIt.get<UserApi>()));

  getIt.registerSingleton(HomeRepository());

  print('Quick Meet is your future!');

  String? token = await storage.getRecord(PrefName.refreshToken);
  String? userId = await storage.getRecord(PrefName.userId);

  if (token != null && token.isNotEmpty && userId != null && userId.isNotEmpty) {
    try {
      AuthRefreshTokenResponse resTokens = await authRepo.refreshToken(path: token);
      UserGetIdResponse userModel =
          await userRepo.userGetId(path: userId, accessToken: resTokens.payload.accessToken);
      await userRepo.setUserData(
          user: alr.AuthLoginResponse(
              user: alr.User(
                  id: userModel.id,
                  firstName: userModel.firstName,
                  secondName: userModel.secondName,
                  lastName: userModel.lastName,
                  accountRank: userModel.accountRank,
                  missSeries: userModel.missSeries,
                  attendSeries: userModel.attendSeries,
                  phoneNumber: userModel.phoneNumber,
                  description: userModel.description,
                  email: userModel.email,
                  registrationDate: userModel.registrationDate,
                  birthDate: userModel.birthDate,
                  active: userModel.active,
                  emailConfirmed: userModel.emailConfirmed,
                  removed: userModel.removed,
                  blocked: userModel.blocked,
                  avatar: alr.Avatar(
                      fileName: userModel.avatar.fileName,
                      href: userModel.avatar.href,
                      id: userModel.avatar.id)),
              payload: alr.Payload(
                  accessToken: resTokens.payload.accessToken,
                  refreshToken: resTokens.payload.refreshToken)),
          token: resTokens.payload.refreshToken);
      authRepo.changeAuthStatus(val: true);
    } catch (e) {
      userRepo.clearUserData();
      authRepo.changeAuthStatus(val: false);
    }
  }

  getIt<Dio>().interceptors.add(InterceptorsWrapper(onError: (error, handler) async {
    if (error.response?.statusCode == 401) {
      if (error.response!.data.toString().isEmpty) {
        String? token = await storage.getRecord(PrefName.refreshToken);
        String? userId = await storage.getRecord(PrefName.userId);
        if (token != null && token.isNotEmpty && userId != null && userId.isNotEmpty) {
          AuthRefreshTokenResponse? resTokens = await authRepo.refreshToken(path: token);
          alr.User userModel = userRepo.user!.user;
          await userRepo.setUserData(
              user: alr.AuthLoginResponse(
                  user: alr.User(
                      id: userModel.id,
                      firstName: userModel.firstName,
                      secondName: userModel.secondName,
                      lastName: userModel.lastName,
                      accountRank: userModel.accountRank,
                      missSeries: userModel.missSeries,
                      attendSeries: userModel.attendSeries,
                      phoneNumber: userModel.phoneNumber,
                      description: userModel.description,
                      email: userModel.email,
                      registrationDate: userModel.registrationDate,
                      birthDate: userModel.birthDate,
                      active: userModel.active,
                      emailConfirmed: userModel.emailConfirmed,
                      removed: userModel.removed,
                      blocked: userModel.blocked,
                      avatar: alr.Avatar(
                          fileName: userModel.avatar.fileName,
                          href: userModel.avatar.href,
                          id: userModel.avatar.id)),
                  payload: alr.Payload(
                      accessToken: resTokens.payload.accessToken,
                      refreshToken: resTokens.payload.refreshToken)),
              token: resTokens.payload.refreshToken);
          authRepo.changeAuthStatus(val: true);
        }
      } else if (error.response?.data['message'] == 'Refresh tokens not same') {
        userRepo.clearUserData();
        authRepo.changeAuthStatus(val: false);
        gs.add(GlobalEvents.toStart);
      }
    }
  }));

  return authRepo.isAuth;
}
