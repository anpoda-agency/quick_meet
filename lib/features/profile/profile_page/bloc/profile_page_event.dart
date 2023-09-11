part of 'profile_page_bloc.dart';

abstract class ProfilePageEvent {}

class ProfilePageInit extends ProfilePageEvent {}

class ProfilePageMsgErr extends ProfilePageEvent {
  final String msg;
  ProfilePageMsgErr(this.msg);
}

class ProfilePageLogOut extends ProfilePageEvent {}

class ProfilePageUpdate extends ProfilePageEvent {}

class ProfileDeleteProfile extends ProfilePageEvent {}

class ProfileUploadPhoto extends ProfilePageEvent {}
