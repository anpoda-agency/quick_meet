import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_meet/data/models/auth_controller/auth_register_request.dart';
import 'package:quick_meet/data/models/auth_controller/auth_register_response.dart';
import 'package:quick_meet/domain/repository/auth_repository.dart';

part 'registration_final_event.dart';
part 'registration_final_state.dart';

class RegistrationFinalBloc extends Bloc<RegistrationFinalEvent, RegistrationFinalState> {
  final AuthRepository authRepository;
  final Map<String, dynamic> fromPreviousPage;
  RegistrationFinalBloc({
    required this.authRepository,
    required this.fromPreviousPage,
    required PageState pageState,
  }) : super(RegistrationFinalInitial(pageState)) {
    on<RegistrationFinalInit>(registrationFinalInit);
    on<RegistrationFinalMsgErr>(registrationFinalMsgErr);
    on<RegistrationFinalInputName>(registrationFinalInputName);
    on<RegistrationFinalInputSecondName>(registrationFinalInputSecondName);
    on<RegistrationFinalInputBirthday>(registrationFinalInputBirthday);
    on<RegistrationFinalSend>(registrationFinalSend);
    on<RegistrationFinalInputMail>(registrationFinalInputMail);
    add(RegistrationFinalInit());
  }

  registrationFinalInit(RegistrationFinalInit event, emit) async {
    var model = state.pageState.request.copyWith(
        phoneNumber: fromPreviousPage['phone'],
        password: fromPreviousPage['password'],
        cityName: 'Саратов',
        cityId: 'bf465fda-7834-47d5-986b-ccdb584a85a6');
    emit(RegistrationFinalUp(state.pageState.copyWith(request: model)));
  }

  registrationFinalInputName(RegistrationFinalInputName event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(RegistrationFinalUp(state.pageState.copyWith(request: model)));
  }

  registrationFinalInputSecondName(RegistrationFinalInputSecondName event, emit) async {
    var model = state.pageState.request.copyWith(secondName: event.value);
    emit(RegistrationFinalUp(state.pageState.copyWith(request: model)));
  }

  registrationFinalInputBirthday(RegistrationFinalInputBirthday event, emit) async {
    var model = state.pageState.request.copyWith(birthDate: event.value);
    emit(RegistrationFinalUp(state.pageState.copyWith(request: model)));
  }

  registrationFinalInputMail(RegistrationFinalInputMail event, emit) async {
    var model = state.pageState.request.copyWith(email: event.value);
    emit(RegistrationFinalUp(state.pageState.copyWith(request: model)));
  }

  registrationFinalSend(RegistrationFinalSend event, emit) async {
    print(state.pageState.request.toJson());
    var res = await authRepository.register(request: state.pageState.request);
    emit(RegistrationFinalAllowedToPush(state.pageState.copyWith(response: res)));
  }

  registrationFinalMsgErr(RegistrationFinalMsgErr event, emit) async {
    emit(RegistrationFinalError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(RegistrationFinalMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
