// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_page_bloc.dart';

abstract class ProfilePageState {
  final PageState pageState;
  const ProfilePageState(this.pageState);
}

class ProfilePageInitial extends ProfilePageState {
  const ProfilePageInitial(PageState pageState) : super(pageState);
}

class ProfilePageUp extends ProfilePageState {
  const ProfilePageUp(PageState pageState) : super(pageState);
}

class ProfilePageError extends ProfilePageState {
  const ProfilePageError(PageState pageState) : super(pageState);
}

// class ProfilePageGetUserInfo extends ProfilePageState {
//   const ProfilePageGetUserInfo(PageState pageState) : super(pageState);
// }

class PageState {
  final bool onAwait;
  final String errMsg;
  //final UserGetIdResponse response;

  const PageState({
    //this.response = const UserGetIdResponse(),
    this.onAwait = false,
    this.errMsg = '',
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    //UserGetIdResponse? response,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      //response: response ?? this.response,
    );
  }
}
