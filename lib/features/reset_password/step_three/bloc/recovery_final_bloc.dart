import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_meet/data/models/auth_controller/auth_reset_password_request.dart';
import 'package:quick_meet/data/models/auth_controller/auth_reset_password_response.dart';
import 'package:quick_meet/domain/repository/auth_repository.dart';

part 'recovery_final_event.dart';
part 'recovery_final_state.dart';

class RecoveryFinalBloc extends Bloc<RecoveryFinalEvent, RecoveryFinalState> {
  final AuthRepository authRepository;
  final String phone;
  RecoveryFinalBloc({
    required this.authRepository,
    required this.phone,
    required PageState pageState,
  }) : super(RecoveryFinalInitial(pageState)) {
    on<RecoveryFinalInit>(recoveryFinalInit);
    on<RecoveryFinalMsgErr>(recoveryFinalMsgErr);
    on<RecoveryFinalInputPassword>(recoveryFinalInputPassword);
    on<RecoveryFinalConfirmPassword>(recoveryFinalConfirmPassword);
    on<RecoveryFinalSend>(recoveryFinalSend);
    add(RecoveryFinalInit());
  }

  recoveryFinalInit(RecoveryFinalInit event, emit) async {
    var model = state.pageState.request.copyWith(phoneNumber: phone);
    emit(RecoveryFinalUp(state.pageState.copyWith(request: model)));
  }

  recoveryFinalInputPassword(RecoveryFinalInputPassword event, emit) async {
    emit(RecoveryFinalUp(state.pageState.copyWith(password: event.value)));
  }

  recoveryFinalConfirmPassword(RecoveryFinalConfirmPassword event, emit) async {
    emit(RecoveryFinalUp(state.pageState.copyWith(passwordConfirm: event.value)));
  }

  recoveryFinalSend(RecoveryFinalSend event, emit) async {
    if (state.pageState.password.length >= 6) {
      emit(RecoveryFinalUp(state.pageState.copyWith(passwordIsShort: false)));
      if (state.pageState.password == state.pageState.passwordConfirm) {
        var model = state.pageState.request.copyWith(password: state.pageState.passwordConfirm);
        var res = await authRepository.resetPassword(request: model);
        emit(RecoveryFinalAllowedToPush(
            state.pageState.copyWith(passwordIsShort: false, confirmPasswordError: false, response: res)));
      } else {
        emit(RecoveryFinalUp(state.pageState.copyWith(confirmPasswordError: true)));
      }
    } else {
      emit(RecoveryFinalUp(state.pageState.copyWith(passwordIsShort: true)));
    }
  }

  recoveryFinalMsgErr(RecoveryFinalMsgErr event, emit) async {
    emit(RecoveryFinalError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(RecoveryFinalMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
