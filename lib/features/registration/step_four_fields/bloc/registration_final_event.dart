part of 'registration_final_bloc.dart';

abstract class RegistrationFinalEvent {}

class RegistrationFinalInit extends RegistrationFinalEvent {}

class RegistrationFinalMsgErr extends RegistrationFinalEvent {
  final String msg;
  RegistrationFinalMsgErr(this.msg);
}

class RegistrationFinalInputName extends RegistrationFinalEvent {
  final String value;
  RegistrationFinalInputName(this.value);
}

class RegistrationFinalInputSecondName extends RegistrationFinalEvent {
  final String value;
  RegistrationFinalInputSecondName(this.value);
}

class RegistrationFinalInputBirthday extends RegistrationFinalEvent {
  final String value;
  RegistrationFinalInputBirthday(this.value);
}

class RegistrationFinalSend extends RegistrationFinalEvent {}

class RegistrationFinalInputMail extends RegistrationFinalEvent {
  final String value;
  RegistrationFinalInputMail(this.value);
}
