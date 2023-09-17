// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_password_bloc.dart';

abstract class AuthPasswordState {
  final PageState pageState;
  const AuthPasswordState(this.pageState);
}

class AuthPasswordInitial extends AuthPasswordState {
  const AuthPasswordInitial(PageState pageState) : super(pageState);
}

class AuthPasswordUp extends AuthPasswordState {
  const AuthPasswordUp(PageState pageState) : super(pageState);
}

class AuthPasswordAllowedToPush extends AuthPasswordState {
  const AuthPasswordAllowedToPush(PageState pageState) : super(pageState);
}

class AuthPasswordError extends AuthPasswordState {
  const AuthPasswordError(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;

  final AuthLoginRequest request;
  final AuthLoginResponse response;

  final bool phoneError;
  final bool passwordError;

  final String passwordErrorText;

  const PageState({
    this.phoneError = false,
    this.passwordError = false,
    this.passwordErrorText = '',
    this.request = const AuthLoginRequest(),
    this.response = const AuthLoginResponse(),
    this.onAwait = false,
    this.errMsg = '',
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    AuthLoginRequest? request,
    AuthLoginResponse? response,
    bool? phoneError,
    bool? passwordError,
    String? phoneErrorText,
    String? passwordErrorText,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
      phoneError: phoneError ?? this.phoneError,
      passwordError: passwordError ?? this.passwordError,
      passwordErrorText: passwordErrorText ?? this.passwordErrorText,
    );
  }
}
