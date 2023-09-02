import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_meet/domain/repository/activation_code_repository.dart';
import 'package:quick_meet/domain/router/route_constants.dart';
import 'package:quick_meet/domain/router/route_impl.dart';
import 'package:quick_meet/features/core_widgets/auth_custom_sms_code_input_widget.dart';
import 'package:quick_meet/features/core_widgets/custom_button_widget.dart';
import 'package:quick_meet/features/core_widgets/pop_up_custom_one_button_widget.dart';
import 'package:quick_meet/features/reset_password/step_two/bloc/recovery_sms_bloc.dart';

class PasswordRecoverySmsCodePage extends StatefulWidget {
  const PasswordRecoverySmsCodePage({super.key, required this.args});
  final Object? args;

  @override
  State<PasswordRecoverySmsCodePage> createState() => _PasswordRecoverySmsCodePageState();
}

class _PasswordRecoverySmsCodePageState extends State<PasswordRecoverySmsCodePage> {
  late String phone;

  @override
  void initState() {
    phone = (widget.args is String) ? widget.args as String : '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecoverySmsBloc(
        activationCodeRepository: context.read<GetIt>().get<ActivationCodeRepository>(),
        phoneNumber: phone,
        pageState: const PageState(),
      ),
      child: BlocConsumer<RecoverySmsBloc, RecoverySmsState>(
        listener: (context, state) {
          if (state is RecoverySmsAllowedToPush) {
            context
                .read<RouteImpl>()
                .push('auth/${RootRoutes.resetPasswordEnterPassword.name}', args: state.pageState.request.source);
            // Navigator.pushNamed(context, '/password_recovery_enter_page', arguments: state.pageState.request.source);
          }
          if (state is RecoverySmsError) {
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
                      Navigator.pushNamed(context, '/password_recovery_enter_page',
                          arguments: state.pageState.request.source);
                    },
                    icon: const Icon(Icons.backup)),
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthCustomSmsCodeInputWidget(
                    onChanged: (value) => context.read<RecoverySmsBloc>().add(RecoverySmsInputCode(value))),
                CustomButtonWidget(
                    onPressed: () => context.read<RecoverySmsBloc>().add(RecoverySmsSend()),
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
