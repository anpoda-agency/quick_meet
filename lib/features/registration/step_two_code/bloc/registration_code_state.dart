// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'registration_code_bloc.dart';

abstract class RegistrationCodeState {
  final PageState pageState;
  const RegistrationCodeState(this.pageState);
}

class RegistrationCodeInitial extends RegistrationCodeState {
  const RegistrationCodeInitial(PageState pageState) : super(pageState);
}

class RegistrationCodeUp extends RegistrationCodeState {
  const RegistrationCodeUp(PageState pageState) : super(pageState);
}

class RegistrationCodeAllowedToPush extends RegistrationCodeState {
  const RegistrationCodeAllowedToPush(PageState pageState) : super(pageState);
}

class RegistrationCodeError extends RegistrationCodeState {
  const RegistrationCodeError(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final CodeConfirmNumberRequest request;
  final CodeConfirmNumberResponse response;

  const PageState({
    this.request = const CodeConfirmNumberRequest(),
    this.response = const CodeConfirmNumberResponse(),
    this.onAwait = false,
    this.errMsg = '',
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    CodeConfirmNumberRequest? request,
    CodeConfirmNumberResponse? response,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
    );
  }
}
