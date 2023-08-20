// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'recovery_sms_bloc.dart';

abstract class RecoverySmsState {
  final PageState pageState;
  const RecoverySmsState(this.pageState);
}

class RecoverySmsInitial extends RecoverySmsState {
  const RecoverySmsInitial(PageState pageState) : super(pageState);
}

class RecoverySmsUp extends RecoverySmsState {
  const RecoverySmsUp(PageState pageState) : super(pageState);
}

class RecoverySmsAllowedToPush extends RecoverySmsState {
  const RecoverySmsAllowedToPush(PageState pageState) : super(pageState);
}

class RecoverySmsError extends RecoverySmsState {
  const RecoverySmsError(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final CodeConfirmNumberRequest request;
  final CodeConfirmNumberResponse response;

  const PageState({
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
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
    );
  }
}
