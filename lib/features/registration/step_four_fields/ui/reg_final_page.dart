import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_meet/domain/repository/auth_repository.dart';
import 'package:quick_meet/domain/router/route_constants.dart';
import 'package:quick_meet/domain/router/route_impl.dart';
import 'package:quick_meet/features/core_widgets/auth_logo_area_widget.dart';
import 'package:quick_meet/features/core_widgets/auth_main_custom_label_widget.dart';
import 'package:quick_meet/features/core_widgets/custom_text_field_widget.dart';
import 'package:quick_meet/features/core_widgets/pop_up_custom_one_button_widget.dart';
import 'package:quick_meet/features/registration/step_four_fields/bloc/registration_final_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegFinalPage extends StatefulWidget {
  const RegFinalPage({super.key, required this.args});
  final Object? args;

  @override
  State<RegFinalPage> createState() => _RegFinalPageState();
}

class _RegFinalPageState extends State<RegFinalPage> {
  MaskTextInputFormatter birthFormat =
      MaskTextInputFormatter(mask: '##-##-####', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);

  late Map<String, dynamic> phoneAndPassword;

  @override
  void initState() {
    phoneAndPassword =
        (widget.args is Map<String, dynamic>) ? widget.args as Map<String, dynamic> : {'phone': '', 'password': ''};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationFinalBloc(
        authRepository: context.read<GetIt>().get<AuthRepository>(),
        fromPreviousPage: phoneAndPassword,
        pageState: const PageState(),
      ),
      child: BlocConsumer<RegistrationFinalBloc, RegistrationFinalState>(
        listener: (context, state) {
          if (state is RegistrationFinalAllowedToPush) {
            // PopUpCustomOneButtonWidget(
            //   popUpMessage: 'Hi, ${state.pageState.response.user.firstName}!',
            //   buttonTitle: 'Закрыть',
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            // ).showPopUpCustomOneButtonWidget(context);
            context.read<RouteImpl>().go(MapRoutes.map.name);
          }
          if (state is RegistrationFinalError) {
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
                      AuthLogoAreaWidget(heightRatioRelativeScreen: 0.2),
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
                        textFieldTitle: 'Имя*',
                        onChanged: (value) =>
                            context.read<RegistrationFinalBloc>().add(RegistrationFinalInputName(value)),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFieldWidget(
                        textFieldTitle: 'Фамилия*',
                        onChanged: (value) =>
                            context.read<RegistrationFinalBloc>().add(RegistrationFinalInputSecondName(value)),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFieldWidget(
                        textFieldTitle: 'Дата рождения*',
                        inputFormatter: [birthFormat],
                        onChanged: (value) =>
                            context.read<RegistrationFinalBloc>().add(RegistrationFinalInputBirthday(value)),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFieldWidget(
                        textFieldTitle: 'Электронная почта*',
                        onChanged: (value) =>
                            context.read<RegistrationFinalBloc>().add(RegistrationFinalInputMail(value)),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      _regButton(
                        context: context,
                        onPressed: () => context.read<RegistrationFinalBloc>().add(RegistrationFinalSend()),
                      ),
                      /*
                      CustomButtonWidget(
                          onPressed: () => context
                              .read<RegistrationFinalBloc>()
                              .add(RegistrationFinalSend()),
                          title: 'Зарегистрироваться',
                          backgroundColor: const Color(0xFF6B4EFF),
                          widthPadding: 50),
                      */
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

Widget _regButton({
  required BuildContext context,
  required VoidCallback onPressed,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 50),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: ShapeDecoration(
        color: const Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          //() => context.read<RegistrationFinalBloc>().add(RegistrationFinalSend()),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6B4EFF),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          ),
          child: const Text(
            'Зарегистрироваться',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.95,
            ),
          )),
    ),
  );
}
