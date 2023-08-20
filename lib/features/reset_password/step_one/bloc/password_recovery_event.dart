part of 'password_recovery_bloc.dart';

abstract class PasswordRecoveryEvent {}

class PasswordRecoveryInit extends PasswordRecoveryEvent {}

class PasswordRecoveryInputNumber extends PasswordRecoveryEvent {
  final String value;
  PasswordRecoveryInputNumber(this.value);
}

class PasswordRecoverySend extends PasswordRecoveryEvent {}

class PasswordRecoveryMsgErr extends PasswordRecoveryEvent {
  final String msg;
  PasswordRecoveryMsgErr(this.msg);
}
