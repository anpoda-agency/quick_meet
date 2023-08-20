part of 'recovery_sms_bloc.dart';

abstract class RecoverySmsEvent {}

class RecoverySmsInit extends RecoverySmsEvent {}

class RecoverySmsInputCode extends RecoverySmsEvent {
  final String value;
  RecoverySmsInputCode(this.value);
}

class RecoverySmsSend extends RecoverySmsEvent {}

class RecoverySmsMsgErr extends RecoverySmsEvent {
  final String msg;
  RecoverySmsMsgErr(this.msg);
}
