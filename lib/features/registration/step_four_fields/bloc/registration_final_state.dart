// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'registration_final_bloc.dart';

abstract class RegistrationFinalState {
  final PageState pageState;
  const RegistrationFinalState(this.pageState);
}

class RegistrationFinalInitial extends RegistrationFinalState {
  const RegistrationFinalInitial(PageState pageState) : super(pageState);
}

class RegistrationFinalUp extends RegistrationFinalState {
  const RegistrationFinalUp(PageState pageState) : super(pageState);
}

class RegistrationFinalAllowedToPush extends RegistrationFinalState {
  const RegistrationFinalAllowedToPush(PageState pageState) : super(pageState);
}

class RegistrationFinalError extends RegistrationFinalState {
  const RegistrationFinalError(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final AuthRegisterRequest request;
  final AuthLoginResponse response;

  const PageState({
    this.request = const AuthRegisterRequest(),
    this.response = const AuthLoginResponse(),
    this.onAwait = false,
    this.errMsg = '',
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    AuthRegisterRequest? request,
    AuthLoginResponse? response,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
    );
  }
}
