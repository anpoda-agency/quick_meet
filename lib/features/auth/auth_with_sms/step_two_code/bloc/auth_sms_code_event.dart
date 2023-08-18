part of 'auth_sms_code_bloc.dart';

abstract class AuthSmsCodeEvent {}

class AuthSmsCodeInit extends AuthSmsCodeEvent {}

class AuthSmsCodeInputValue extends AuthSmsCodeEvent {
  final String value;
  AuthSmsCodeInputValue(this.value);
}

class AuthSmsCodeSend extends AuthSmsCodeEvent {}

class AuthSmsCodeMsgErr extends AuthSmsCodeEvent {
  final String msg;
  AuthSmsCodeMsgErr(this.msg);
}
