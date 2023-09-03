// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'recovery_final_bloc.dart';

abstract class RecoveryFinalState {
  final PageState pageState;
  const RecoveryFinalState(this.pageState);
}

class RecoveryFinalInitial extends RecoveryFinalState {
  const RecoveryFinalInitial(PageState pageState) : super(pageState);
}

class RecoveryFinalUp extends RecoveryFinalState {
  const RecoveryFinalUp(PageState pageState) : super(pageState);
}

class RecoveryFinalAllowedToPush extends RecoveryFinalState {
  const RecoveryFinalAllowedToPush(PageState pageState) : super(pageState);
}

class RecoveryFinalError extends RecoveryFinalState {
  const RecoveryFinalError(PageState pageState) : super(pageState);
}

class PageState {
  final AuthResetPasswordRequest request;
  final AuthLoginResponse response;
  final String password;
  final String passwordConfirm;
  final bool confirmPasswordError;
  final bool passwordIsShort;
  final bool onAwait;
  final String errMsg;

  const PageState({
    this.password = '',
    this.passwordConfirm = '',
    this.request = const AuthResetPasswordRequest(),
    this.response = const AuthLoginResponse(),
    this.onAwait = false,
    this.errMsg = '',
    this.confirmPasswordError = false,
    this.passwordIsShort = false,
  });

  PageState copyWith({
    AuthResetPasswordRequest? request,
    AuthLoginResponse? response,
    String? password,
    String? passwordConfirm,
    bool? confirmPasswordError,
    bool? passwordIsShort,
    bool? onAwait,
    String? errMsg,
  }) {
    return PageState(
      request: request ?? this.request,
      response: response ?? this.response,
      password: password ?? this.password,
      passwordConfirm: passwordConfirm ?? this.passwordConfirm,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
      passwordIsShort: passwordIsShort ?? this.passwordIsShort,
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
    );
  }
}
