import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_send_activation_request.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_send_activation_response.dart';
import 'package:quick_meet/domain/repository/activation_code_repository.dart';

part 'auth_with_sms_event.dart';
part 'auth_with_sms_state.dart';

class AuthWithSmsBloc extends Bloc<AuthWithSmsEvent, AuthWithSmsState> {
  final ActivationCodeRepository activationCodeRepository;

  AuthWithSmsBloc({
    required this.activationCodeRepository,
    required PageState pageState,
  }) : super(AuthWithSmsInitial(pageState)) {
    on<AuthWithSmsInit>(authWithSmsInit);
    on<AuthWithSmsEnterPhone>(authWithSmsEnterPhone);
    on<AuthWithSmsSendPhone>(authWithSmsSendPhone);
    on<AuthWithSmsMsgErr>(authWithSmsMsgErr);
    add(AuthWithSmsInit());
  }

  authWithSmsInit(AuthWithSmsInit event, emit) async {
    var model = state.pageState.request
        .copyWith(verificationStep: "VERIFICATION", verificationType: "PHONE");
    emit(AuthWithSmsUp(state.pageState.copyWith(request: model)));
  }

  authWithSmsEnterPhone(AuthWithSmsEnterPhone event, emit) async {
    String formattedNumber = event.value
        .replaceAll(' ', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('-', '')
        .replaceAll('+', '');
    var model = state.pageState.request.copyWith(source: formattedNumber);
    bool removeErr = false;
    if (state.pageState.phoneError &&
        formattedNumber.length != 11 &&
        state.pageState.errMsg == 'Некорректный номер телефона') {
      removeErr = true;
    }
    emit(AuthWithSmsUp(state.pageState.copyWith(
      request: model,
      phoneError: removeErr,
    )));
  }

  authWithSmsSendPhone(AuthWithSmsSendPhone event, emit) async {
    // emit(AuthWithSmsUp(state.pageState.copyWith(errMsg: '', phoneError: false)));
    if (state.pageState.request.source.length != 11) {
      emit(AuthWithSmsError(state.pageState
          .copyWith(onAwait: false, phoneError: true, errMsg: 'Некорректный номер телефона')));
    } else {
      var res = await activationCodeRepository.codeSend(request: state.pageState.request);
      if (!res.success) {
        if (res.message == 'User with phone not found') {
          emit(AuthWithSmsError(state.pageState
              .copyWith(onAwait: false, errMsg: 'Пользователь не найден', phoneError: true)));
        } else if (res.message.contains('Retry available after')) {
          int index = res.message.indexOf('2');
          DateTime timeAfter = DateTime.parse(res.message.substring(index));
          DateTime timeNow = DateTime.now();
          emit(AuthWithSmsError(state.pageState.copyWith(
              onAwait: false,
              errMsg: 'Повторный код через ${timeAfter.difference(timeNow).inSeconds} секунд',
              phoneError: true)));
        } else {
          emit(AuthWithSmsError(
              state.pageState.copyWith(onAwait: false, errMsg: res.message, phoneError: true)));
        }
      } else {
        emit(AuthWithSmsAllowedToPush(
            state.pageState.copyWith(response: res, errMsg: '', phoneError: false)));
      }
    }
  }

  authWithSmsMsgErr(AuthWithSmsMsgErr event, emit) async {
    emit(AuthWithSmsError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(AuthWithSmsMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
