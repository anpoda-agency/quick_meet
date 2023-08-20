part of 'recovery_final_bloc.dart';

abstract class RecoveryFinalEvent {}

class RecoveryFinalInit extends RecoveryFinalEvent {}

class RecoveryFinalInputPassword extends RecoveryFinalEvent {
  final String value;
  RecoveryFinalInputPassword(this.value);
}

class RecoveryFinalConfirmPassword extends RecoveryFinalEvent {
  final String value;
  RecoveryFinalConfirmPassword(this.value);
}

class RecoveryFinalSend extends RecoveryFinalEvent {}

class RecoveryFinalMsgErr extends RecoveryFinalEvent {
  final String msg;
  RecoveryFinalMsgErr(this.msg);
}
