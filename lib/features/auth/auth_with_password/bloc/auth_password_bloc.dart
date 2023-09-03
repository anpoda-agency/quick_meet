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
    var model = state.pageState.request.copyWith(phoneNumber: event.value);
    emit(AuthPasswordUp(state.pageState.copyWith(request: model)));
  }

  authPasswordInputPassword(AuthPasswordInputPassword event, emit) async {
    var model = state.pageState.request.copyWith(password: event.value);
    emit(AuthPasswordUp(state.pageState.copyWith(request: model)));
  }

  authPasswordSendLogin(AuthPasswordSendLogin event, emit) async {
    var res = await authRepository.login(request: state.pageState.request);
    await userRepository.setUserData(user: res, token: res.payload.refreshToken);
    authRepository.changeAuthStatus(val: true);
    emit(AuthPasswordAllowedToPush(state.pageState.copyWith(response: res)));
  }

  authPasswordMsgErr(AuthPasswordMsgErr event, emit) async {
    emit(AuthPasswordError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(AuthPasswordMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
