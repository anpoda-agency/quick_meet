import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_meet/domain/repository/activation_code_repository.dart';
import 'package:quick_meet/features/core_widgets/auth_logo_area_widget.dart';
import 'package:quick_meet/features/core_widgets/auth_main_custom_label_widget.dart';
import 'package:quick_meet/features/core_widgets/custom_button_widget.dart';
import 'package:quick_meet/features/core_widgets/custom_text_field_widget.dart';
import 'package:quick_meet/features/core_widgets/pop_up_custom_one_button_widget.dart';
import 'package:quick_meet/features/registration/step_one_phone/bloc/registration_phone_bloc.dart';

class RegPhonePage extends StatefulWidget {
  const RegPhonePage({super.key});

  @override
  State<RegPhonePage> createState() => _RegPhonePageState();
}

class _RegPhonePageState extends State<RegPhonePage> {
  final TextEditingController _phoneTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationPhoneBloc(
        activationCodeRepository: context.read<GetIt>().get<ActivationCodeRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<RegistrationPhoneBloc, RegistrationPhoneState>(
        listener: (context, state) {
          if (state is RegistrationPhoneError) {
            PopUpCustomOneButtonWidget(
              popUpMessage: state.pageState.errMsg,
              buttonTitle: 'Закрыть',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ).showPopUpCustomOneButtonWidget(context);
          }
          if (state is RegistrationPhoneAllowedToPush) {
            Navigator.pushNamed(context, '/reg_sms_code_page', arguments: state.pageState.request.source);
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
                      Navigator.pushNamed(context, '/reg_sms_code_page', arguments: state.pageState.request.source);
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
                      AuthLogoAreaWidget(heightRatioRelativeScreen: 0.35),
                      Column(
                        children: [
                          AuthMainCustomLabelWidget(
                            topLabel: 'Регистрация в',
                            widthLabelContainer: 250,
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
                            context.read<RegistrationPhoneBloc>().add(RegistrationPhoneInputNumber(value)),
                        controller: _phoneTextController,
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      CustomButtonWidget(
                          onPressed: () {
                            context.read<RegistrationPhoneBloc>().add(RegistrationPhoneSend());
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
