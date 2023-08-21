import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_meet/data/repository/auth_repository.dart';
import 'package:quick_meet/features/auth/auth_with_password/bloc/auth_password_bloc.dart';
import 'package:quick_meet/features/core_widgets/auth_custom_button.dart';
import 'package:quick_meet/features/core_widgets/auth_custom_text_field.dart';
import 'package:quick_meet/features/core_widgets/auth_logo_area.dart';
import 'package:quick_meet/features/core_widgets/auth_main_custom_label.dart';
import 'package:quick_meet/features/core_widgets/pop_up_custom_one_button_widget.dart';

import 'package:quick_meet/features/reset_password/step_one/ui/password_recovery_phone_page.dart';

class AuthPasswordPage extends StatefulWidget {
  const AuthPasswordPage({super.key});

  @override
  State<AuthPasswordPage> createState() => _AuthPasswordPageState();
}

class _AuthPasswordPageState extends State<AuthPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthPasswordBloc(
        authRepository: context.read<GetIt>().get<AuthRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<AuthPasswordBloc, AuthPasswordState>(
        listener: (context, state) {
          if (state is AuthPasswordAllowedToPush) {
            PopUpCustomOneButtonWidget(
              popUpMessage:
                  'Hello, ${state.pageState.response.user.firstName}!',
              buttonTitle: 'Закрыть',
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          }
          if (state is AuthPasswordError) {
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
              backgroundColor: const Color(0xFF6B4EFF),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      AuthLogoAreaWidget(
                        heightRatioRelativeScreen: 0.35,
                      ),
                      AuthMainCustomLabelWidget(topLabel: 'Войти в'),
                    ],
                  ),
                  const SizedBox(
                    height: 49,
                  ),
                  Column(
                    children: [
                      AuthCustomTextFieldWidget(
                        textFieldTitle: 'Номер телефона',
                        onChanged: (value) => context
                            .read<AuthPasswordBloc>()
                            .add(AuthPasswordInputNumber(value)),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      AuthCustomTextFieldWidget(
                        textFieldTitle: 'Пароль',
                        onChanged: (value) => context
                            .read<AuthPasswordBloc>()
                            .add(AuthPasswordInputPassword(value)),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 40),
                        child: InkWell(
                          child: const Text(
                            'Забыли пароль?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 16,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.underline,
                              letterSpacing: 0.80,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PasswordRecoveryPhonePage(
                                          //args: listOrdersModels[index].id,
                                          )),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AuthCustomButtonWidget(
                          onPressed: () => context
                              .read<AuthPasswordBloc>()
                              .add(AuthPasswordSendLogin()),
                          title: 'Войти',
                          backgroundColor: const Color(0xFFF5F5F5),
                          widthPadding: 50),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
