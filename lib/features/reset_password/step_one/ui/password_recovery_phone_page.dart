import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_meet/domain/repository/activation_code_repository.dart';
import 'package:quick_meet/domain/router/route_constants.dart';
import 'package:quick_meet/domain/router/route_impl.dart';
import 'package:quick_meet/features/core_widgets/auth_logo_area_widget.dart';
import 'package:quick_meet/features/core_widgets/auth_main_custom_label_widget.dart';
import 'package:quick_meet/features/core_widgets/custom_button_widget.dart';
import 'package:quick_meet/features/core_widgets/custom_text_field_widget.dart';
import 'package:quick_meet/features/core_widgets/pop_up_custom_one_button_widget.dart';
import 'package:quick_meet/features/reset_password/step_one/bloc/password_recovery_bloc.dart';

class PasswordRecoveryPhonePage extends StatefulWidget {
  const PasswordRecoveryPhonePage({super.key});

  @override
  State<PasswordRecoveryPhonePage> createState() => _PasswordRecoveryPhonePageState();
}

class _PasswordRecoveryPhonePageState extends State<PasswordRecoveryPhonePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordRecoveryBloc(
        activationCodeRepository: context.read<GetIt>().get<ActivationCodeRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<PasswordRecoveryBloc, PasswordRecoveryState>(
        listener: (context, state) {
          if (state is PasswordRecoveryError) {
            PopUpCustomOneButtonWidget(
              popUpMessage: state.pageState.errMsg,
              buttonTitle: 'Закрыть',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ).showPopUpCustomOneButtonWidget(context);
          }
          if (state is PasswordRecoveryAllowedToPush) {
            context
                .read<RouteImpl>()
                .push('auth/${RootRoutes.resetPasswordCode.name}', args: state.pageState.request.source);
            // Navigator.pushNamed(context, '/password_recovery_sms_code_page', arguments: state.pageState.request.source);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF6B4EFF),
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/password_recovery_sms_code_page',
                          arguments: state.pageState.request.source);
                    },
                    icon: const Icon(Icons.backup)),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        textFieldTitle: 'Номер телефона',
                        onChanged: (value) =>
                            context.read<PasswordRecoveryBloc>().add(PasswordRecoveryInputNumber(value)),
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      CustomButtonWidget(
                        onPressed: () => context.read<PasswordRecoveryBloc>().add(PasswordRecoverySend()),
                        title: 'Получить код',
                        backgroundColor: const Color(0xFFF5F5F5),
                        widthPadding: 50,
                      ),
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
