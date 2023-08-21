import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_meet/data/repository/activation_code_repository.dart';
import 'package:quick_meet/features/auth/auth_with_sms/step_two_code/bloc/auth_sms_code_bloc.dart';
import 'package:quick_meet/features/core_widgets/auth_custom_button.dart';
import 'package:quick_meet/features/core_widgets/pop_up_custom_one_button_widget.dart';

class AuthSmsCodePage extends StatefulWidget {
  const AuthSmsCodePage({super.key});
  @override
  State<AuthSmsCodePage> createState() => _AuthSmsCodePageState();
}

class _AuthSmsCodePageState extends State<AuthSmsCodePage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => AuthSmsCodeBloc(
        activationCodeRepository:
            context.read<GetIt>().get<ActivationCodeRepository>(),
        phoneNumber: args,
        pageState: const PageState(),
      ),
      child: BlocConsumer<AuthSmsCodeBloc, AuthSmsCodeState>(
        listener: (context, state) {
          if (state is AuthSmsCodeAllowedToPush) {
            PopUpCustomOneButtonWidget(
              popUpMessage: state.pageState.response.message,
              buttonTitle: 'Закрыть',
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          }
          if (state is AuthSmsCodeError) {
            PopUpCustomOneButtonWidget(
              popUpMessage: state.pageState.errMsg,
              buttonTitle: 'Закрыть',
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white10,
              elevation: 0,
              iconTheme: const IconThemeData(
                color: Colors.black, //change your color here
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 251,
                  child: Text(
                    'Код подтверждения',
                    style: TextStyle(
                      color: Color(0xFF505050),
                      fontSize: 16,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.80,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 10,
                    direction: Axis.horizontal,
                    runSpacing: 10,
                    children: [
                      _otpTextField(
                          context: context,
                          autoFocus: true,
                          onChange: (value) => context
                              .read<AuthSmsCodeBloc>()
                              .add(AuthSmsCodeInputValue(value))),
                      _otpTextField(
                          context: context,
                          autoFocus: true,
                          onChange: (value) => context
                              .read<AuthSmsCodeBloc>()
                              .add(AuthSmsCodeInputValue(value))),
                      _otpTextField(
                          context: context,
                          autoFocus: true,
                          onChange: (value) => context
                              .read<AuthSmsCodeBloc>()
                              .add(AuthSmsCodeInputValue(value))),
                      _otpTextField(
                          context: context,
                          autoFocus: true,
                          onChange: (value) => context
                              .read<AuthSmsCodeBloc>()
                              .add(AuthSmsCodeInputValue(value))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 37,
                ),
                AuthCustomButtonWidget(
                    onPressed: () {
                      context.read<AuthSmsCodeBloc>().add(AuthSmsCodeSend());
                    },
                    title: 'Продолжить',
                    backgroundColor: const Color(0xFFF5F5F5),
                    widthPadding: 50),
              ],
            ),
            //),
          );
        },
      ),
    );
  }
}

Widget _otpTextField(
    {required BuildContext context,
    required bool autoFocus,
    required Function(String value) onChange}) {
  return Container(
    width: 62,
    height: 100,
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFF6B4EFF)),
        borderRadius: BorderRadius.circular(18),
      ),
    ),
    child: AspectRatio(
      aspectRatio: 1,
      child: TextField(
        autofocus: autoFocus,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          fontSize: 50,
        ),
        maxLines: 1,
        onChanged: (value) {
          onChange(value);
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    ),
  );
}
