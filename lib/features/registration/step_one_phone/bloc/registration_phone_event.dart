part of 'registration_phone_bloc.dart';

abstract class RegistrationPhoneEvent {}

class RegistrationPhoneInit extends RegistrationPhoneEvent {}

class RegistrationPhoneInputNumber extends RegistrationPhoneEvent {
  final String value;
  RegistrationPhoneInputNumber(this.value);
}

class RegistrationPhoneSend extends RegistrationPhoneEvent {}

class RegistrationPhoneMsgErr extends RegistrationPhoneEvent {
  final String msg;
  RegistrationPhoneMsgErr(this.msg);
}
