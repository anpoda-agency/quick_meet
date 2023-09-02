// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_sms_code_bloc.dart';

abstract class AuthSmsCodeState {
  final PageState pageState;
  const AuthSmsCodeState(this.pageState);
}

class AuthSmsCodeInitial extends AuthSmsCodeState {
  const AuthSmsCodeInitial(PageState pageState) : super(pageState);
}

class AuthSmsCodeUp extends AuthSmsCodeState {
  const AuthSmsCodeUp(PageState pageState) : super(pageState);
}

class AuthSmsCodeError extends AuthSmsCodeState {
  const AuthSmsCodeError(PageState pageState) : super(pageState);
}

class AuthSmsCodeAllowedToPush extends AuthSmsCodeState {
  const AuthSmsCodeAllowedToPush(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final CodeConfirmNumberRequest request;
  final CodeConfirmNumberResponse response;
  final AuthVerificationLoginResponse responseAuth;

  const PageState({
    this.responseAuth = const AuthVerificationLoginResponse(),
    this.onAwait = false,
    this.errMsg = '',
    this.request = const CodeConfirmNumberRequest(),
    this.response = const CodeConfirmNumberResponse(),
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    CodeConfirmNumberRequest? request,
    CodeConfirmNumberResponse? response,
    AuthVerificationLoginResponse? responseAuth,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
      responseAuth: responseAuth ?? this.responseAuth,
    );
  }
}
