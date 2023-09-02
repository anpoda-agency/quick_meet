import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_send_activation_request.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_send_activation_response.dart';
import 'package:quick_meet/domain/repository/activation_code_repository.dart';

part 'registration_phone_event.dart';
part 'registration_phone_state.dart';

class RegistrationPhoneBloc extends Bloc<RegistrationPhoneEvent, RegistrationPhoneState> {
  final ActivationCodeRepository activationCodeRepository;
  RegistrationPhoneBloc({
    required this.activationCodeRepository,
    required PageState pageState,
  }) : super(RegistrationPhoneInitial(pageState)) {
    on<RegistrationPhoneInit>(registrationPhoneInit);
    on<RegistrationPhoneMsgErr>(registrationPhoneMsgErr);
    on<RegistrationPhoneInputNumber>(registrationPhoneInputNumber);
    on<RegistrationPhoneSend>(registrationPhoneSend);
    add(RegistrationPhoneInit());
  }

  registrationPhoneInit(RegistrationPhoneInit event, emit) async {
    var model = state.pageState.request.copyWith(verificationStep: 'REGISTRATION', verificationType: 'PHONE');
    emit(RegistrationPhoneUp(state.pageState.copyWith(request: model)));
  }

  registrationPhoneInputNumber(RegistrationPhoneInputNumber event, emit) async {
    var model = state.pageState.request.copyWith(source: event.value);
    emit(RegistrationPhoneUp(state.pageState.copyWith(request: model)));
  }

  registrationPhoneSend(RegistrationPhoneSend event, emit) async {
    var res = await activationCodeRepository.codeSend(request: state.pageState.request);
    if (!res.success) {
      emit(RegistrationPhoneError(state.pageState.copyWith(
        onAwait: false,
        errMsg: res.message,
      )));
    } else {
      emit(RegistrationPhoneAllowedToPush(state.pageState.copyWith(response: res)));
    }
  }

  registrationPhoneMsgErr(RegistrationPhoneMsgErr event, emit) async {
    emit(RegistrationPhoneError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(RegistrationPhoneMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
