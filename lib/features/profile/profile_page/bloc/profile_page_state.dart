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

class ProfilePageLogOutState extends ProfilePageState {
  const ProfilePageLogOutState(PageState pageState) : super(pageState);
}

class ProfilePageError extends ProfilePageState {
  const ProfilePageError(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final AuthLoginResponse user;
  final String yearsOld;

  const PageState({
    this.user = const AuthLoginResponse(),
    this.onAwait = false,
    this.errMsg = '',
    this.yearsOld = '',
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    AuthLoginResponse? user,
    String? yearsOld,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      user: user ?? this.user,
      yearsOld: yearsOld ?? this.yearsOld,
    );
  }
}
