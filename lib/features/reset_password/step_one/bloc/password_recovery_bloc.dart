import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_send_activation_request.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_send_activation_response.dart';
import 'package:quick_meet/data/repository/activation_code_repository.dart';

part 'password_recovery_event.dart';
part 'password_recovery_state.dart';

class PasswordRecoveryBloc extends Bloc<PasswordRecoveryEvent, PasswordRecoveryState> {
  final ActivationCodeRepository activationCodeRepository;
  PasswordRecoveryBloc({
    required this.activationCodeRepository,
    required PageState pageState,
  }) : super(PasswordRecoveryInitial(pageState)) {
    on<PasswordRecoveryInputNumber>(passwordRecoveryInputNumber);
    on<PasswordRecoverySend>(passwordRecoverySend);
    on<PasswordRecoveryInit>(passwordRecoveryInit);
    on<PasswordRecoveryMsgErr>(passwordRecoveryMsgErr);
    add(PasswordRecoveryInit());
  }

  passwordRecoveryInit(PasswordRecoveryInit event, emit) async {
    var model = state.pageState.request.copyWith(verificationStep: 'VERIFICATION', verificationType: 'PHONE');
    emit(PasswordRecoveryUp(state.pageState.copyWith(request: model)));
  }

  passwordRecoveryInputNumber(PasswordRecoveryInputNumber event, emit) async {
    var model = state.pageState.request.copyWith(source: event.value);
    emit(PasswordRecoveryUp(state.pageState.copyWith(request: model)));
  }

  passwordRecoverySend(PasswordRecoverySend event, emit) async {
    var res = await activationCodeRepository.codeSend(request: state.pageState.request);
    if (!res.success) {
      emit(PasswordRecoveryError(state.pageState.copyWith(
        onAwait: false,
        errMsg: res.message,
      )));
    } else {
      emit(PasswordRecoveryAllowedToPush(state.pageState.copyWith(response: res)));
    }
  }

  passwordRecoveryMsgErr(PasswordRecoveryMsgErr event, emit) async {
    emit(PasswordRecoveryError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(PasswordRecoveryMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
