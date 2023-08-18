part of 'auth_password_bloc.dart';

abstract class AuthPasswordEvent {}

class AuthPasswordInit extends AuthPasswordEvent {}

class AuthPasswordInputNumber extends AuthPasswordEvent {
  final String value;
  AuthPasswordInputNumber(this.value);
}

class AuthPasswordInputPassword extends AuthPasswordEvent {
  final String value;
  AuthPasswordInputPassword(this.value);
}

class AuthPasswordSendLogin extends AuthPasswordEvent {}

class AuthPasswordMsgErr extends AuthPasswordEvent {
  final String msg;
  AuthPasswordMsgErr(this.msg);
}
