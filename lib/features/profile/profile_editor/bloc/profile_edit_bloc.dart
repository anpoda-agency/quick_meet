import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_meet/data/models/auth_controller/auth_login_response.dart' as alr;
import 'package:quick_meet/data/models/user_controller/user_update_id_request.dart';
import 'package:quick_meet/data/models/user_controller/user_update_id_response.dart';
import 'package:quick_meet/domain/repository/auth_repository.dart';
import 'package:quick_meet/domain/repository/home_repository.dart';
import 'package:quick_meet/domain/repository/user_repository.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final UserRepository userRepository;
  final AuthRepository authRepository;
  final HomeRepository homeRepository;
  ProfileEditBloc({
    required this.authRepository,
    required this.homeRepository,
    required this.userRepository,
    required PageState pageState,
  }) : super(ProfileEditInitial(pageState)) {
    on<ProfileEditInit>(profileEditInit);
    on<ProfileEditMsgErr>(profileEditMsgErr);
    on<ProfileEditInputName>(profileEditInputName);
    on<ProfileEditInputSecondName>(profileEditInputSecondName);
    on<ProfileEditInputMail>(profileEditInputMail);
    on<ProfileEditInputDescriptionAboutMe>(profileEditInputDescriptionAboutMe);
    on<ProfileEditSendChanges>(profileEditSendChanges);
    on<ProfileEditSendDeleteProfile>(profileEditSendDeleteProfile);
    on<ProfileEditUploadPhoto>(profileEditUploadPhoto);
    on<ProfileEditDeletePhoto>(profileEditDeletePhoto);
    add(ProfileEditInit());
  }

  profileEditInit(ProfileEditInit event, emit) async {
    emit(ProfileEditUp(state.pageState.copyWith(onAwait: true)));
    await Future.delayed(const Duration(milliseconds: 300));
    var user = userRepository.user;
    if (user != null) {
      var model = state.pageState.request.copyWith(
        firstName: user.user.firstName,
        secondName: user.user.secondName,
        email: user.user.email,
        description: user.user.description,
        deleted: false,
      );
      emit(ProfileEditUp(state.pageState.copyWith(request: model)));
    }
    emit(ProfileEditUp(state.pageState.copyWith(onAwait: false)));
  }

  profileEditDeletePhoto(ProfileEditDeletePhoto event, emit) async {
    var res = await userRepository.userRemoveAvatar(
      accessToken: userRepository.user?.payload.accessToken ?? '',
      path: userRepository.user?.user.id ?? '',
    );
    alr.User? repositoryUserModel = userRepository.user?.user.copyWith(
      avatar: alr.Avatar(fileName: res.avatar.fileName, href: res.avatar.href, id: res.avatar.id),
    );
    await userRepository.setUserData(
        user: userRepository.user?.copyWith(user: repositoryUserModel) ?? const alr.AuthLoginResponse());
    emit(ProfileEditUp(state.pageState.copyWith(imagePath: '')));
  }

  profileEditUploadPhoto(ProfileEditUploadPhoto event, emit) async {
    final ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    emit(ProfileEditUp(state.pageState.copyWith(imagePath: file?.path ?? '')));
  }

  profileEditInputName(ProfileEditInputName event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditInputSecondName(ProfileEditInputSecondName event, emit) async {
    var model = state.pageState.request.copyWith(secondName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditInputMail(ProfileEditInputMail event, emit) async {
    var model = state.pageState.request.copyWith(email: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditInputDescriptionAboutMe(ProfileEditInputDescriptionAboutMe event, emit) async {
    var model = state.pageState.request.copyWith(description: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditSendChanges(ProfileEditSendChanges event, emit) async {
    String token = userRepository.user?.payload.accessToken ?? '';
    String id = userRepository.user?.user.id ?? '';

    var res = await userRepository.userUpdateId(request: state.pageState.request, accessToken: token, path: id);

    if (state.pageState.imagePath.isNotEmpty) {
      var res = await userRepository.userUploadAvatar(
          accessToken: userRepository.user?.payload.accessToken ?? '',
          path: userRepository.user?.user.id ?? '',
          file: File(state.pageState.imagePath));

      alr.User? repositoryUserModel = userRepository.user?.user.copyWith(
        firstName: res.firstName,
        secondName: res.secondName,
        description: res.description,
        email: res.email,
        avatar: alr.Avatar(fileName: res.avatar.fileName, href: res.avatar.href, id: res.avatar.id),
      );
      await userRepository.setUserData(
          user: userRepository.user?.copyWith(user: repositoryUserModel) ?? const alr.AuthLoginResponse());
    } else {
      alr.User? repositoryUserModel = userRepository.user?.user.copyWith(
        firstName: res.firstName,
        secondName: res.secondName,
        description: res.description,
        email: res.email,
        avatar: const alr.Avatar(),
      );
      await userRepository.setUserData(
          user: userRepository.user?.copyWith(user: repositoryUserModel) ?? const alr.AuthLoginResponse());
    }

    emit(ProfileEditAllowedToPush(state.pageState.copyWith(response: res)));
  }

  profileEditSendDeleteProfile(ProfileEditSendDeleteProfile event, emit) async {
    String token = userRepository.user?.payload.accessToken ?? '';
    String id = userRepository.user?.user.id ?? '';

    var res = await userRepository.userUpdateId(
        request: state.pageState.request.copyWith(deleted: true), accessToken: token, path: id);
    await userRepository.clearUserData();
    authRepository.changeAuthStatus(val: false);
    homeRepository.changeVisibleNavBar(visible: true);
    emit(ProfileEditDeletedAccountState(state.pageState.copyWith(response: res)));
  }

  profileEditMsgErr(ProfileEditMsgErr event, emit) async {
    emit(ProfileEditError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ProfileEditMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
