// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'registration_phone_bloc.dart';

abstract class RegistrationPhoneState {
  final PageState pageState;
  const RegistrationPhoneState(this.pageState);
}

class RegistrationPhoneInitial extends RegistrationPhoneState {
  const RegistrationPhoneInitial(PageState pageState) : super(pageState);
}

class RegistrationPhoneUp extends RegistrationPhoneState {
  const RegistrationPhoneUp(PageState pageState) : super(pageState);
}

class RegistrationPhoneAllowedToPush extends RegistrationPhoneState {
  const RegistrationPhoneAllowedToPush(PageState pageState) : super(pageState);
}

class RegistrationPhoneError extends RegistrationPhoneState {
  const RegistrationPhoneError(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final CodeSendActivationRequest request;
  final CodeSendActivationResponse response;

  const PageState({
    this.request = const CodeSendActivationRequest(),
    this.response = const CodeSendActivationResponse(),
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
