import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_meet/data/repository/activation_code_repository.dart';
import 'package:quick_meet/features/auth/auth_with_sms/step_two_code/bloc/auth_sms_code_bloc.dart';
import 'package:quick_meet/features/core_widgets/custom_button_widget.dart';
import 'package:quick_meet/features/core_widgets/auth_custom_sms_code_input_widget.dart';
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
            ).showPopUpCustomOneButtonWidget(context);
          }
          if (state is AuthSmsCodeError) {
            PopUpCustomOneButtonWidget(
              popUpMessage: state.pageState.errMsg,
              buttonTitle: 'Закрыть',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ).showPopUpCustomOneButtonWidget(context);
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
                AuthCustomSmsCodeInputWidget(
                    onChanged: (value) => context
                        .read<AuthSmsCodeBloc>()
                        .add(AuthSmsCodeInputValue(value))),
                CustomButtonWidget(
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
