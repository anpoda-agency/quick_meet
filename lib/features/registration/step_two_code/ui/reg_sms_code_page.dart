import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_meet/domain/repository/activation_code_repository.dart';
import 'package:quick_meet/features/core_widgets/auth_custom_sms_code_input_widget.dart';
import 'package:quick_meet/features/core_widgets/custom_button_widget.dart';
import 'package:quick_meet/features/core_widgets/pop_up_custom_one_button_widget.dart';
import 'package:quick_meet/features/registration/step_two_code/bloc/registration_code_bloc.dart';

class RegSmsCodePage extends StatefulWidget {
  const RegSmsCodePage({super.key});

  @override
  State<RegSmsCodePage> createState() => _RegSmsCodePageState();
}

class _RegSmsCodePageState extends State<RegSmsCodePage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => RegistrationCodeBloc(
        activationCodeRepository: context.read<GetIt>().get<ActivationCodeRepository>(),
        phoneNumber: args,
        pageState: const PageState(),
      ),
      child: BlocConsumer<RegistrationCodeBloc, RegistrationCodeState>(
        listener: (context, state) {
          if (state is RegistrationCodeAllowedToPush) {
            Navigator.pushNamed(context, '/reg_password_page', arguments: state.pageState.request.source);
          }
          if (state is RegistrationCodeError) {
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
                color: Colors.black,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/reg_password_page', arguments: state.pageState.request.source);
                    },
                    icon: const Icon(Icons.backup)),
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthCustomSmsCodeInputWidget(
                    onChanged: (value) => context.read<RegistrationCodeBloc>().add(RegistrationCodeInput(value))),
                CustomButtonWidget(
                    onPressed: () => context.read<RegistrationCodeBloc>().add(RegistrationCodeSend()),
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
