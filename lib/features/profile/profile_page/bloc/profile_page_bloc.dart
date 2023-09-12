import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_meet/data/models/auth_controller/auth_login_response.dart';
import 'package:quick_meet/data/service/number_formatter.dart';
import 'package:quick_meet/domain/repository/auth_repository.dart';
import 'package:quick_meet/domain/repository/user_repository.dart';
import 'package:quick_meet/features/profile/profile_page/data/menu_items.dart';
import 'package:quick_meet/features/profile/profile_page/models/menu_item_model.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  final UserRepository userRepository;
  final AuthRepository authRepository;
  ProfilePageBloc({
    required this.userRepository,
    required this.authRepository,
    required PageState pageState,
  }) : super(ProfilePageInitial(pageState)) {
    on<ProfilePageInit>(profilePageInit);
    on<ProfilePageMsgErr>(profilePageMsgErr);
    on<ProfilePageLogOut>(profilePageLogOut);
    on<ProfilePageUpdate>(profilePageUpdate);
    on<ProfileDeleteProfile>(profileDeleteProfile);
    on<ProfileUploadPhoto>(profileUploadPhoto);
    add(ProfilePageInit());
  }

  update() {
    add(ProfilePageUpdate());
  }

  profilePageInit(ProfilePageInit event, emit) async {
    userRepository.removeListener(update);
    userRepository.addListener(update);
    var model = userRepository.user;
    String age = '';
    List<MenuItemModel> listItems = [];

    if (model != null) {
      age = NumberFormatter.ageFormat(model.user.birthDate);
      if (model.user.avatar.href != 'deleted' && model.user.avatar.href.isNotEmpty) {
        listItems.addAll(MenuItems.items);
      } else {
        listItems.add(MenuItems.itemEditPersonalData);
        listItems.add(MenuItems.itemChangePhoto);
      }
    } else {
      listItems.add(MenuItems.itemEditPersonalData);
      listItems.add(MenuItems.itemChangePhoto);
    }

    emit(ProfilePageUp(state.pageState.copyWith(user: model, yearsOld: age, menuItems: listItems)));
  }

  profilePageUpdate(ProfilePageUpdate event, emit) async {
    userRepository.removeListener(update);
    userRepository.addListener(update);
    var model = userRepository.user;
    String age = '';
    List<MenuItemModel> listItems = [];

    if (model != null) {
      age = NumberFormatter.ageFormat(model.user.birthDate);
      if (model.user.avatar.href != 'deleted' && model.user.avatar.href.isNotEmpty) {
        listItems.addAll(MenuItems.items);
      } else {
        listItems.add(MenuItems.itemEditPersonalData);
        listItems.add(MenuItems.itemChangePhoto);
      }
    } else {
      listItems.add(MenuItems.itemEditPersonalData);
      listItems.add(MenuItems.itemChangePhoto);
    }

    emit(ProfilePageUp(state.pageState.copyWith(user: model, yearsOld: age, menuItems: listItems)));
  }

  profileDeleteProfile(ProfileDeleteProfile event, emit) async {
    if (state.pageState.user.user.avatar.href != 'deleted') {
      var res = await userRepository.userRemoveAvatar(
        accessToken: userRepository.user?.payload.accessToken ?? '',
        path: userRepository.user?.user.id ?? '',
      );
      User? repositoryUserModel = userRepository.user?.user.copyWith(
        avatar: Avatar(fileName: res.avatar.fileName, href: res.avatar.href, id: res.avatar.id),
      );
      await userRepository.setUserData(
          user: userRepository.user?.copyWith(user: repositoryUserModel) ?? const AuthLoginResponse());
      emit(ProfilePageUp(state.pageState.copyWith(user: userRepository.user)));
    }
  }

  profileUploadPhoto(ProfileUploadPhoto event, emit) async {
    final ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      var res = await userRepository.userUploadAvatar(
          accessToken: userRepository.user?.payload.accessToken ?? '',
          path: userRepository.user?.user.id ?? '',
          file: File(file.path));

      User? repositoryUserModel = userRepository.user?.user
          .copyWith(avatar: Avatar(fileName: res.avatar.fileName, href: res.avatar.href, id: res.avatar.id));

      await userRepository.setUserData(
          user: userRepository.user?.copyWith(user: repositoryUserModel) ?? const AuthLoginResponse());

      emit(ProfilePageUp(state.pageState.copyWith(user: userRepository.user)));
    }
  }

  profilePageMsgErr(ProfilePageMsgErr event, emit) async {
    emit(ProfilePageError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  profilePageLogOut(ProfilePageLogOut event, emit) async {
    await userRepository.clearUserData();
    authRepository.changeAuthStatus(val: false);
    emit(ProfilePageLogOutState(state.pageState.copyWith()));
  }

  @override
  Future<void> close() {
    userRepository.removeListener(update);
    return super.close();
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ProfilePageMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
