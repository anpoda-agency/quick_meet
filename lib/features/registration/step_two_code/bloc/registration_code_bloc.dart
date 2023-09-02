import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_confirm_number_request.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_confirm_number_response.dart';
import 'package:quick_meet/domain/repository/activation_code_repository.dart';

part 'registration_code_event.dart';
part 'registration_code_state.dart';

class RegistrationCodeBloc extends Bloc<RegistrationCodeEvent, RegistrationCodeState> {
  final ActivationCodeRepository activationCodeRepository;
  final String phoneNumber;

  RegistrationCodeBloc({
    required this.phoneNumber,
    required this.activationCodeRepository,
    required PageState pageState,
  }) : super(RegistrationCodeInitial(pageState)) {
    on<RegistrationCodeInit>(registrationCodeInit);
    on<RegistrationCodeMsgErr>(registrationCodeMsgErr);
    on<RegistrationCodeInput>(registrationCodeInput);
    on<RegistrationCodeSend>(registrationCodeSend);
    add(RegistrationCodeInit());
  }

  registrationCodeInit(RegistrationCodeInit event, emit) async {
    var model = state.pageState.request
        .copyWith(verificationStep: "REGISTRATION", verificationType: "PHONE", source: phoneNumber);
    emit(RegistrationCodeUp(state.pageState.copyWith(request: model)));
  }

  registrationCodeInput(RegistrationCodeInput event, emit) async {
    late String code;
    if (event.value.isEmpty) {
      code = state.pageState.request.code.substring(0, state.pageState.request.code.length - 1);
    } else {
      code = state.pageState.request.code + event.value;
    }
    var model = state.pageState.request.copyWith(code: code);
    emit(RegistrationCodeUp(state.pageState.copyWith(request: model)));
  }

  registrationCodeSend(RegistrationCodeSend event, emit) async {
    var res = await activationCodeRepository.codeConfirm(request: state.pageState.request);
    if (!res.success) {
      emit(RegistrationCodeError(state.pageState.copyWith(
        onAwait: false,
        errMsg: res.message,
      )));
    } else {
      emit(RegistrationCodeAllowedToPush(state.pageState.copyWith(response: res)));
    }
  }

  registrationCodeMsgErr(RegistrationCodeMsgErr event, emit) async {
    emit(RegistrationCodeError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(RegistrationCodeMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
