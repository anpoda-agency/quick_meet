import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_confirm_number_request.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_confirm_number_response.dart';
import 'package:quick_meet/data/repository/activation_code_repository.dart';

part 'auth_sms_code_event.dart';
part 'auth_sms_code_state.dart';

class AuthSmsCodeBloc extends Bloc<AuthSmsCodeEvent, AuthSmsCodeState> {
  final ActivationCodeRepository activationCodeRepository;
  final String phoneNumber;

  AuthSmsCodeBloc({
    required this.phoneNumber,
    required PageState pageState,
    required this.activationCodeRepository,
  }) : super(AuthSmsCodeInitial(pageState)) {
    on<AuthSmsCodeInit>(authSmsCodeInit);
    on<AuthSmsCodeMsgErr>(authSmsCodeMsgErr);
    on<AuthSmsCodeInputValue>(authSmsCodeInputValue);
    on<AuthSmsCodeSend>(authSmsCodeSend);
    add(AuthSmsCodeInit());
  }

  authSmsCodeInit(AuthSmsCodeInit event, emit) async {
    var model = state.pageState.request
        .copyWith(verificationStep: "VERIFICATION", verificationType: "PHONE", source: phoneNumber);
    emit(AuthSmsCodeUp(state.pageState.copyWith(request: model)));
  }

  authSmsCodeInputValue(AuthSmsCodeInputValue event, emit) async {
    late String code;
    if (event.value.isEmpty) {
      code = state.pageState.request.code.substring(0, state.pageState.request.code.length - 1);
    } else {
      code = state.pageState.request.code + event.value;
    }
    print(code);
    var model = state.pageState.request.copyWith(code: code);
    emit(AuthSmsCodeUp(state.pageState.copyWith(request: model)));
  }

  authSmsCodeSend(AuthSmsCodeSend event, emit) async {
    var res = await activationCodeRepository.codeConfirm(request: state.pageState.request);
    if (!res.success) {
      emit(AuthSmsCodeError(state.pageState.copyWith(
        onAwait: false,
        errMsg: res.message,
      )));
    } else {
      emit(AuthSmsCodeAllowedToPush(state.pageState.copyWith(response: res)));
    }
  }

  authSmsCodeMsgErr(AuthSmsCodeMsgErr event, emit) async {
    emit(AuthSmsCodeError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(AuthSmsCodeMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
