import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_confirm_number_request.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_confirm_number_response.dart';
import 'package:quick_meet/domain/repository/activation_code_repository.dart';

part 'recovery_sms_event.dart';
part 'recovery_sms_state.dart';

class RecoverySmsBloc extends Bloc<RecoverySmsEvent, RecoverySmsState> {
  final ActivationCodeRepository activationCodeRepository;
  final String phoneNumber;

  RecoverySmsBloc({
    required PageState pageState,
    required this.phoneNumber,
    required this.activationCodeRepository,
  }) : super(RecoverySmsInitial(pageState)) {
    on<RecoverySmsInit>(recoverySmsInit);
    on<RecoverySmsMsgErr>(recoverySmsMsgErr);
    on<RecoverySmsInputCode>(recoverySmsInputCode);
    on<RecoverySmsSend>(recoverySmsSend);
    add(RecoverySmsInit());
  }

  recoverySmsInit(RecoverySmsInit event, emit) async {
    var model = state.pageState.request
        .copyWith(verificationStep: "VERIFICATION", verificationType: "PHONE", source: phoneNumber);
    emit(RecoverySmsUp(state.pageState.copyWith(request: model)));
  }

  recoverySmsInputCode(RecoverySmsInputCode event, emit) async {
    late String code;
    if (event.value.isEmpty) {
      code = state.pageState.request.code.substring(0, state.pageState.request.code.length - 1);
    } else {
      code = state.pageState.request.code + event.value;
    }
    var model = state.pageState.request.copyWith(code: code);
    emit(RecoverySmsUp(state.pageState.copyWith(request: model)));
  }

  recoverySmsSend(RecoverySmsSend event, emit) async {
    var res = await activationCodeRepository.codeConfirm(request: state.pageState.request);
    if (!res.success) {
      emit(RecoverySmsError(state.pageState.copyWith(
        onAwait: false,
        errMsg: res.message,
      )));
    } else {
      emit(RecoverySmsAllowedToPush(state.pageState.copyWith(response: res)));
    }
  }

  recoverySmsMsgErr(RecoverySmsMsgErr event, emit) async {
    emit(RecoverySmsError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(RecoverySmsMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
