// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_with_sms_bloc.dart';

abstract class AuthWithSmsState {
  final PageState pageState;
  const AuthWithSmsState(this.pageState);
}

class AuthWithSmsInitial extends AuthWithSmsState {
  const AuthWithSmsInitial(PageState pageState) : super(pageState);
}

class AuthWithSmsUp extends AuthWithSmsState {
  const AuthWithSmsUp(PageState pageState) : super(pageState);
}

class AuthWithSmsAllowedToPush extends AuthWithSmsState {
  const AuthWithSmsAllowedToPush(PageState pageState) : super(pageState);
}

class AuthWithSmsError extends AuthWithSmsState {
  const AuthWithSmsError(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final CodeSendActivationRequest request;
  final CodeSendActivationResponse response;

  const PageState({
    this.response = const CodeSendActivationResponse(),
    this.request = const CodeSendActivationRequest(),
    this.onAwait = false,
    this.errMsg = '',
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    CodeSendActivationRequest? request,
    CodeSendActivationResponse? response,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
    );
  }
}
