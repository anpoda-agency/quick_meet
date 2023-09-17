import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_meet/data/models/auth_controller/auth_login_request.dart';
import 'package:quick_meet/data/models/auth_controller/auth_login_response.dart';
import 'package:quick_meet/domain/repository/auth_repository.dart';
import 'package:quick_meet/domain/repository/user_repository.dart';

part 'auth_password_event.dart';
part 'auth_password_state.dart';

class AuthPasswordBloc extends Bloc<AuthPasswordEvent, AuthPasswordState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  AuthPasswordBloc({
    required this.authRepository,
    required this.userRepository,
    required PageState pageState,
  }) : super(AuthPasswordInitial(pageState)) {
    on<AuthPasswordInit>(authPasswordInit);
    on<AuthPasswordMsgErr>(authPasswordMsgErr);
    on<AuthPasswordInputNumber>(authPasswordInputNumber);
    on<AuthPasswordInputPassword>(authPasswordInputPassword);
    on<AuthPasswordSendLogin>(authPasswordSendLogin);
    add(AuthPasswordInit());
  }

  authPasswordInit(AuthPasswordInit event, emit) async {
    emit(AuthPasswordUp(state.pageState));
  }

  authPasswordInputNumber(AuthPasswordInputNumber event, emit) async {
    String formattedNumber =
        event.value.replaceAll(' ', '').replaceAll('(', '').replaceAll(')', '').replaceAll('-', '').replaceAll('+', '');
    var model = state.pageState.request.copyWith(phoneNumber: formattedNumber);

    bool removeErr = false;
    if (state.pageState.phoneError && formattedNumber.length != 11) {
      removeErr = true;
    }

    emit(AuthPasswordUp(state.pageState.copyWith(request: model, phoneError: removeErr, passwordError: false)));
  }

  authPasswordInputPassword(AuthPasswordInputPassword event, emit) async {
    var model = state.pageState.request.copyWith(password: event.value);
    emit(AuthPasswordUp(state.pageState.copyWith(request: model, passwordError: false)));
  }

  authPasswordSendLogin(AuthPasswordSendLogin event, emit) async {
    if (state.pageState.request.phoneNumber.length == 11) {
      emit(AuthPasswordUp(state.pageState.copyWith(phoneError: false, passwordError: false)));
      var res = await authRepository.login(request: state.pageState.request);
      await userRepository.setUserData(user: res, token: res.payload.refreshToken);
      authRepository.changeAuthStatus(val: true);
      emit(AuthPasswordAllowedToPush(state.pageState.copyWith(response: res)));
    } else {
      emit(AuthPasswordError(state.pageState.copyWith(
        onAwait: false,
        phoneError: true,
      )));
    }
  }

  authPasswordMsgErr(AuthPasswordMsgErr event, emit) async {
    emit(AuthPasswordError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
    if (state.pageState.errMsg == 'User not found') {
      emit(AuthPasswordUp(
          state.pageState.copyWith(passwordError: true, passwordErrorText: 'Неверный логин или пароль')));
    } else if (state.pageState.errMsg == 'User removed') {
      emit(AuthPasswordUp(
          state.pageState.copyWith(passwordError: true, passwordErrorText: 'Аккаунт пользователя удален')));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(AuthPasswordMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
