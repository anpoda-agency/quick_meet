import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_meet/data/models/user_controller/user_update_id_request.dart';
import 'package:quick_meet/data/models/user_controller/user_update_id_response.dart';
import 'package:quick_meet/data/repository/user_repository.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final UserRepository userRepository;
  final Map<String, dynamic> fromPreviousPage;
  ProfileEditBloc({
    required this.userRepository,
    required this.fromPreviousPage,
    required PageState pageState,
  }) : super(ProfileEditInitial(pageState)) {
    on<ProfileEditInit>(profileEditInit);
    on<ProfileEditMsgErr>(profileEditMsgErr);
    on<ProfileEditInputName>(profileEditInputName);
    on<ProfileEditInputSecondName>(profileEditInputSecondName);
    on<ProfileEditInputMail>(profileEditInputMail);
    on<ProfileEditInputDescriptionAboutMe>(profileEditInputDescriptionAboutMe);
    on<ProfileEditSendChanges>(profileEditSendChanges);
    on<ProfileEditSendDeleteProfile>(profileEditSendDeleteProfile);
  }

  profileEditInit(ProfileEditInit event, emit) async {
    var model = state.pageState.request.copyWith(
      firstName: fromPreviousPage['firstName'],
      secondName: fromPreviousPage['secondName'],
      email: fromPreviousPage['email'],
      description: fromPreviousPage['description'],
      deleted: false,
    );
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditInputName(ProfileEditInputName event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditInputSecondName(ProfileEditInputSecondName event, emit) async {
    var model = state.pageState.request.copyWith(secondName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditInputMail(ProfileEditInputMail event, emit) async {
    var model = state.pageState.request.copyWith(email: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditInputDescriptionAboutMe(
      ProfileEditInputDescriptionAboutMe event, emit) async {
    var model = state.pageState.request.copyWith(email: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditSendChanges(ProfileEditSendChanges event, emit) async {
    print(state.pageState.request.toJson());
    var res =
        await userRepository.userUpdateId(request: state.pageState.request);
    emit(ProfileEditAllowedToPush(state.pageState.copyWith(response: res)));
  }

  profileEditSendDeleteProfile(ProfileEditSendDeleteProfile event, emit) async {
    print(state.pageState.request.toJson());
    var res =
        await userRepository.userUpdateId(request: state.pageState.request);
    emit(ProfileEditAllowedToPush(state.pageState.copyWith(response: res)));
  }

  profileEditMsgErr(ProfileEditMsgErr event, emit) async {
    emit(ProfileEditError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ProfileEditMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
