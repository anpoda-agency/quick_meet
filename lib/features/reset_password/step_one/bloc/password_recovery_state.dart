// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'password_recovery_bloc.dart';

abstract class PasswordRecoveryState {
  final PageState pageState;
  const PasswordRecoveryState(this.pageState);
}

class PasswordRecoveryInitial extends PasswordRecoveryState {
  const PasswordRecoveryInitial(PageState pageState) : super(pageState);
}

class PasswordRecoveryUp extends PasswordRecoveryState {
  const PasswordRecoveryUp(PageState pageState) : super(pageState);
}

class PasswordRecoveryAllowedToPush extends PasswordRecoveryState {
  const PasswordRecoveryAllowedToPush(PageState pageState) : super(pageState);
}

class PasswordRecoveryError extends PasswordRecoveryState {
  const PasswordRecoveryError(PageState pageState) : super(pageState);
}

class PageState {
  final CodeSendActivationRequest request;
  final CodeSendActivationResponse response;
  final bool onAwait;
  final String errMsg;

  const PageState({
    this.request = const CodeSendActivationRequest(),
    this.response = const CodeSendActivationResponse(),
    this.onAwait = false,
    this.errMsg = '',
  });

  PageState copyWith({
    CodeSendActivationRequest? request,
    CodeSendActivationResponse? response,
    bool? onAwait,
    String? errMsg,
  }) {
    return PageState(
      request: request ?? this.request,
      response: response ?? this.response,
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
    );
  }
}
