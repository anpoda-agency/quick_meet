import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_meet/data/network/api/activation_code_api.dart';
import 'package:quick_meet/data/network/api/auth_api.dart';
import 'package:quick_meet/data/network/dio_client.dart';
import 'package:quick_meet/data/repository/activation_code_repository.dart';
import 'package:quick_meet/data/repository/auth_repository.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<DioClient>(DioClient(getIt<Dio>()));

  getIt.registerSingleton(ActivationCodeApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(ActivationCodeRepository(activationCodeApi: getIt.get<ActivationCodeApi>()));

  getIt.registerSingleton(AuthApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(AuthRepository(authApi: getIt.get<AuthApi>()));

  print('Quick Meet is your future!');
}
