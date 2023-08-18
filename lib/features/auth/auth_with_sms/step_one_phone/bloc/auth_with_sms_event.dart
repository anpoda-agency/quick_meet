part of 'auth_with_sms_bloc.dart';

abstract class AuthWithSmsEvent {}

class AuthWithSmsInit extends AuthWithSmsEvent {}

class AuthWithSmsEnterPhone extends AuthWithSmsEvent {
  final String value;
  AuthWithSmsEnterPhone(this.value);
}

class AuthWithSmsSendPhone extends AuthWithSmsEvent {}

class AuthWithSmsMsgErr extends AuthWithSmsEvent {
  final String msg;
  AuthWithSmsMsgErr(this.msg);
}
