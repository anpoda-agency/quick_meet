part of 'registration_code_bloc.dart';

abstract class RegistrationCodeEvent {}

class RegistrationCodeInit extends RegistrationCodeEvent {}

class RegistrationCodeInput extends RegistrationCodeEvent {
  final String value;
  RegistrationCodeInput(this.value);
}

class RegistrationCodeSend extends RegistrationCodeEvent {}

class RegistrationCodeMsgErr extends RegistrationCodeEvent {
  final String msg;
  RegistrationCodeMsgErr(this.msg);
}
