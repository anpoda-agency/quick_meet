import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_confirm_number_request.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_confirm_number_response.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_send_activation_request.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_send_activation_response.dart';
import 'package:quick_meet/data/models/auth_controller/auth_login_response.dart';
import 'package:quick_meet/domain/repository/activation_code_repository.dart';
import 'package:quick_meet/domain/repository/auth_repository.dart';
import 'package:quick_meet/domain/repository/user_repository.dart';

part 'auth_sms_code_event.dart';
part 'auth_sms_code_state.dart';

class AuthSmsCodeBloc extends Bloc<AuthSmsCodeEvent, AuthSmsCodeState> {
  final ActivationCodeRepository activationCodeRepository;
  final AuthRepository authRepository;
  final UserRepository userRepository;
  final String phoneNumber;

  AuthSmsCodeBloc({
    required this.phoneNumber,
    required PageState pageState,
    required this.authRepository,
    required this.userRepository,
    required this.activationCodeRepository,
  }) : super(AuthSmsCodeInitial(pageState)) {
    on<AuthSmsCodeInit>(authSmsCodeInit);
    on<AuthSmsCodeMsgErr>(authSmsCodeMsgErr);
    on<AuthSmsCodeInputValue>(authSmsCodeInputValue);
    on<AuthSmsCodeSend>(authSmsCodeSend);
    on<AuthSmsGetCode>(authSmsGetCode);
    add(AuthSmsCodeInit());
  }

  authSmsCodeInit(AuthSmsCodeInit event, emit) async {
    var modelCode = state.pageState.requestCode
        .copyWith(verificationStep: "VERIFICATION", verificationType: "PHONE", source: phoneNumber);
    var model = state.pageState.request
        .copyWith(verificationStep: "VERIFICATION", verificationType: "PHONE", source: phoneNumber);
    emit(AuthSmsCodeUp(state.pageState.copyWith(request: model, requestCode: modelCode)));
  }

  authSmsCodeInputValue(AuthSmsCodeInputValue event, emit) async {
    var model = state.pageState.request.copyWith(code: event.value);
    emit(AuthSmsCodeUp(state.pageState.copyWith(request: model, errMsg: '')));
    event.completed ? add(AuthSmsCodeSend()) : null;
  }

  authSmsCodeSend(AuthSmsCodeSend event, emit) async {
    var res = await activationCodeRepository.codeConfirm(request: state.pageState.request);
    if (!res.success) {
      if (res.message == 'Code not verified') {
        emit(AuthSmsCodeError(state.pageState.copyWith(
          onAwait: false,
          errMsg: 'Неверный код',
        )));
      } else {
        emit(AuthSmsCodeError(state.pageState.copyWith(
          onAwait: false,
          errMsg: res.message,
        )));
      }
    } else {
      var resAuth = await authRepository.verificationLogin(phone: state.pageState.request.source);
      await userRepository.setUserData(user: resAuth, token: resAuth.payload.refreshToken);
      authRepository.changeAuthStatus(val: true);
      emit(AuthSmsCodeAllowedToPush(state.pageState.copyWith(responseAuth: resAuth)));
    }
  }

  authSmsGetCode(AuthSmsGetCode event, emit) async {
    // emit(AuthWithSmsUp(state.pageState.copyWith(errMsg: '', phoneError: false)));
    if (state.pageState.request.source.length != 11) {
      emit(AuthSmsCodeError(state.pageState.copyWith(
        onAwait: false,
        // phoneError: true, errMsg: 'Некорректный номер телефона'
      )));
    } else {
      var res = await activationCodeRepository.codeSend(request: state.pageState.requestCode);
      if (!res.success) {
        if (res.message == 'User with phone not found') {
          emit(AuthSmsCodeError(state.pageState.copyWith(
            onAwait: false, errMsg: 'Пользователь не найден',
            // phoneError: true
          )));
        } else if (res.message.contains('Retry available after')) {
          int index = res.message.indexOf('2');
          DateTime timeAfter = DateTime.parse(res.message.substring(index));
          DateTime timeNow = DateTime.now();
          emit(AuthSmsCodeError(state.pageState.copyWith(
            onAwait: false,
            errMsg: 'Повторный код через ${timeAfter.difference(timeNow).inSeconds} секунд',
            // phoneError: true
          )));
        } else {
          emit(AuthSmsCodeError(state.pageState.copyWith(
            onAwait: false, errMsg: res.message,
            // phoneError: true
          )));
        }
      }
    }
  }

  authSmsCodeMsgErr(AuthSmsCodeMsgErr event, emit) async {
    if (event.msg == 'Code not verified') {
      emit(AuthSmsCodeError(state.pageState.copyWith(
        onAwait: false,
        errMsg: 'Неверный код',
      )));
    } else {
      emit(AuthSmsCodeError(state.pageState.copyWith(
        onAwait: false,
        errMsg: event.msg,
      )));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(AuthSmsCodeMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
