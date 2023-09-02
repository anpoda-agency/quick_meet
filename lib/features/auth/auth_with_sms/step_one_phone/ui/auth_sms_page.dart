import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_meet/domain/repository/activation_code_repository.dart';
import 'package:quick_meet/features/auth/auth_with_sms/step_one_phone/bloc/auth_with_sms_bloc.dart';
import 'package:quick_meet/features/core_widgets/custom_button_widget.dart';
import 'package:quick_meet/features/core_widgets/custom_text_field_widget.dart';
import 'package:quick_meet/features/core_widgets/auth_logo_area_widget.dart';
import 'package:quick_meet/features/core_widgets/auth_main_custom_label_widget.dart';
import 'package:quick_meet/features/core_widgets/pop_up_custom_one_button_widget.dart';

class AuthSmsPage extends StatefulWidget {
  const AuthSmsPage({super.key});

  @override
  State<AuthSmsPage> createState() => _AuthSmsPageState();
}

class _AuthSmsPageState extends State<AuthSmsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthWithSmsBloc(
        activationCodeRepository: context.read<GetIt>().get<ActivationCodeRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<AuthWithSmsBloc, AuthWithSmsState>(
        listener: (context, state) {
          if (state is AuthWithSmsError) {
            PopUpCustomOneButtonWidget(
                popUpMessage: state.pageState.errMsg,
                buttonTitle: 'Закрыть',
                onPressed: () {
                  Navigator.of(context).pop();
                }).showPopUpCustomOneButtonWidget(context);
          }
          if (state is AuthWithSmsAllowedToPush) {
            Navigator.pushNamed(context, '/auth_sms_code_page', arguments: state.pageState.request.source);
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
                      Navigator.pushNamed(context, '/auth_sms_code_page', arguments: state.pageState.request.source);
                    },
                    icon: const Icon(Icons.backup)),
              ],
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
                      AuthMainCustomLabelWidget(
                        topLabel: 'Войти в',
                        widthLabelContainer: 200,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 49,
                  ),
                  Column(
                    children: [
                      CustomTextFieldWidget(
                        textFieldTitle: 'Номер телефона',
                        onChanged: (value) => context.read<AuthWithSmsBloc>().add(AuthWithSmsEnterPhone(value)),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      CustomButtonWidget(
                          onPressed: () {
                            context.read<AuthWithSmsBloc>().add(AuthWithSmsSendPhone());
                          },
                          title: 'Получить код',
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
