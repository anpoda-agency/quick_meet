import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_meet/data/models/auth_controller/auth_login_response.dart';
import 'package:quick_meet/data/service/number_formatter.dart';
import 'package:quick_meet/domain/repository/auth_repository.dart';
import 'package:quick_meet/domain/repository/user_repository.dart';

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
    add(ProfilePageInit());
  }

  profilePageInit(ProfilePageInit event, emit) async {
    var model = userRepository.user;
    String age = '';

    if (model != null) {
      age = NumberFormatter.ageFormat(model.user.birthDate);
    }

    emit(ProfilePageUp(state.pageState.copyWith(user: model, yearsOld: age)));
  }

  profilePageUpdate(ProfilePageUpdate event, emit) async {
    var model = userRepository.user;
    String age = '';

    if (model != null) {
      age = NumberFormatter.ageFormat(model.user.birthDate);
    }

    emit(ProfilePageUp(state.pageState.copyWith(user: model, yearsOld: age)));
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
  void onError(Object error, StackTrace stackTrace) {
    add(ProfilePageMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
