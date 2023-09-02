import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_meet/domain/repository/auth_repository.dart';
import 'package:quick_meet/features/core_widgets/auth_logo_area_widget.dart';
import 'package:quick_meet/features/core_widgets/auth_main_custom_label_widget.dart';
import 'package:quick_meet/features/core_widgets/custom_button_widget.dart';
import 'package:quick_meet/features/core_widgets/custom_text_field_widget.dart';
import 'package:quick_meet/features/core_widgets/pop_up_custom_one_button_widget.dart';
import 'package:quick_meet/features/reset_password/step_three/bloc/recovery_final_bloc.dart';

class PasswordRecoveryEnterPage extends StatefulWidget {
  const PasswordRecoveryEnterPage({super.key});

  @override
  State<PasswordRecoveryEnterPage> createState() => _PasswordRecoveryEnterPageState();
}

class _PasswordRecoveryEnterPageState extends State<PasswordRecoveryEnterPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => RecoveryFinalBloc(
        authRepository: context.read<GetIt>().get<AuthRepository>(),
        phone: args,
        pageState: const PageState(),
      ),
      child: BlocConsumer<RecoveryFinalBloc, RecoveryFinalState>(
        listener: (context, state) {
          if (state is RecoveryFinalAllowedToPush) {
            PopUpCustomOneButtonWidget(
              popUpMessage: 'Hi, ${state.pageState.response.user.firstName}!',
              buttonTitle: 'Закрыть',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ).showPopUpCustomOneButtonWidget(context);
          }
          if (state is RecoveryFinalError) {
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
              backgroundColor: const Color(0xFF6B4EFF),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      AuthLogoAreaWidget(heightRatioRelativeScreen: 0.35),
                      Column(
                        children: [
                          AuthMainCustomLabelWidget(
                            topLabel: 'Сбросить пароль в',
                            widthLabelContainer: 320,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 49,
                  ),
                  Column(
                    children: [
                      CustomTextFieldWidget(
                        textFieldTitle: 'Новый пароль',
                        errorText: state.pageState.passwordIsShort ? 'Не менее 6 символов' : null,
                        onChanged: (value) => context.read<RecoveryFinalBloc>().add(RecoveryFinalInputPassword(value)),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFieldWidget(
                        textFieldTitle: 'Повторите пароль',
                        errorText: state.pageState.confirmPasswordError ? 'Пароли не совпадают' : null,
                        onChanged: (value) =>
                            context.read<RecoveryFinalBloc>().add(RecoveryFinalConfirmPassword(value)),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomButtonWidget(
                          onPressed: () => context.read<RecoveryFinalBloc>().add(RecoveryFinalSend()),
                          title: 'Изменить',
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
