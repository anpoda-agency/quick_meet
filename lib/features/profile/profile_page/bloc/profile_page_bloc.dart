import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_meet/data/models/user_controller/user_get_id_response.dart';
import 'package:quick_meet/data/repository/user_repository.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  final UserRepository userRepository;
  ProfilePageBloc({
    required this.userRepository,
    required PageState pageState,
  }) : super(ProfilePageInitial(pageState)) {
    on<ProfilePageInit>(profilePageInit);
    on<ProfilePageMsgErr>(profilePageMsgErr);
    on<ProfilePageGetUserInfo>(profilePageGetUserInfo);
    add(ProfilePageInit());
  }

  profilePageInit(ProfilePageInit event, emit) async {
    emit(ProfilePageUp(state.pageState));
  }

  profilePageMsgErr(ProfilePageMsgErr event, emit) async {
    emit(ProfilePageError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  profilePageGetUserInfo(ProfilePageGetUserInfo event, emit) async {
    //print(state.pageState.response.toJson());
    //var result = await userRepository.userGetId(path: path)
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ProfilePageMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
