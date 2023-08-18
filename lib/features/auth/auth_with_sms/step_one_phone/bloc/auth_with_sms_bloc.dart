import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_send_activation_request.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_send_activation_response.dart';
import 'package:quick_meet/data/repository/activation_code_repository.dart';

part 'auth_with_sms_event.dart';
part 'auth_with_sms_state.dart';

class AuthWithSmsBloc extends Bloc<AuthWithSmsEvent, AuthWithSmsState> {
  final ActivationCodeRepository activationCodeRepository;

  AuthWithSmsBloc({
    required this.activationCodeRepository,
    required PageState pageState,
  }) : super(AuthWithSmsInitial(pageState)) {
    on<AuthWithSmsInit>(authWithSmsInit);
    on<AuthWithSmsEnterPhone>(authWithSmsEnterPhone);
    on<AuthWithSmsSendPhone>(authWithSmsSendPhone);
    on<AuthWithSmsMsgErr>(authWithSmsMsgErr);
    add(AuthWithSmsInit());
  }

  authWithSmsInit(AuthWithSmsInit event, emit) async {
    var model = state.pageState.request.copyWith(verificationStep: "VERIFICATION", verificationType: "PHONE");
    emit(AuthWithSmsUp(state.pageState.copyWith(request: model)));
  }

  authWithSmsEnterPhone(AuthWithSmsEnterPhone event, emit) async {
    var model = state.pageState.request.copyWith(source: event.value);
    emit(AuthWithSmsUp(state.pageState.copyWith(request: model)));
  }

  authWithSmsSendPhone(AuthWithSmsSendPhone event, emit) async {
    var res = await activationCodeRepository.codeSend(request: state.pageState.request);
    if (!res.success) {
      emit(AuthWithSmsError(state.pageState.copyWith(
        onAwait: false,
        errMsg: res.message,
      )));
    } else {
      emit(AuthWithSmsUp(state.pageState.copyWith(response: res)));
    }
  }

  authWithSmsMsgErr(AuthWithSmsMsgErr event, emit) async {
    emit(AuthWithSmsError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(AuthWithSmsMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
