part of 'profile_edit_bloc.dart';

abstract class ProfileEditEvent {}

class ProfileEditInit extends ProfileEditEvent {}

class ProfileEditMsgErr extends ProfileEditEvent {
  final String msg;
  ProfileEditMsgErr(this.msg);
}

class ProfileEditInputName extends ProfileEditEvent {
  final String value;
  ProfileEditInputName(this.value);
}

class ProfileEditInputSecondName extends ProfileEditEvent {
  final String value;
  ProfileEditInputSecondName(this.value);
}

class ProfileEditInputMail extends ProfileEditEvent {
  final String value;
  ProfileEditInputMail(this.value);
}

class ProfileEditInputDescriptionAboutMe extends ProfileEditEvent {
  final String value;
  ProfileEditInputDescriptionAboutMe(this.value);
}

class ProfileEditSendChanges extends ProfileEditEvent {}

class ProfileEditSendDeleteProfile extends ProfileEditEvent {}
