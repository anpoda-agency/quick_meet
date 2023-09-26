import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pinput/pinput.dart';
import 'package:quick_meet/core/constants.dart';
import 'package:quick_meet/domain/repository/activation_code_repository.dart';
import 'package:quick_meet/domain/repository/auth_repository.dart';
import 'package:quick_meet/domain/repository/user_repository.dart';
import 'package:quick_meet/domain/router/route_constants.dart';
import 'package:quick_meet/domain/router/route_impl.dart';
import 'package:quick_meet/features/auth/auth_with_sms/step_two_code/bloc/auth_sms_code_bloc.dart';
import 'package:quick_meet/features/core_widgets/auth_widgets/auth_body_container.dart';
import 'package:quick_meet/features/core_widgets/auth_widgets/auth_custom_text_button.dart';
import 'package:quick_meet/features/core_widgets/auth_widgets/auth_scaffold.dart';
import 'package:quick_meet/features/core_widgets/svg_image.dart';

class AuthSmsCodePage extends StatefulWidget {
  const AuthSmsCodePage({super.key, required this.args});
  final Object? args;

  @override
  State<AuthSmsCodePage> createState() => _AuthSmsCodePageState();
}

class _AuthSmsCodePageState extends State<AuthSmsCodePage> {
  late String phone;

  @override
  void initState() {
    phone = (widget.args is String) ? widget.args as String : '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthSmsCodeBloc(
        activationCodeRepository: context.read<GetIt>().get<ActivationCodeRepository>(),
        authRepository: context.read<GetIt>().get<AuthRepository>(),
        userRepository: context.read<GetIt>().get<UserRepository>(),
        phoneNumber: phone,
        pageState: const PageState(),
      ),
      child: BlocConsumer<AuthSmsCodeBloc, AuthSmsCodeState>(
        listener: (context, state) {
          if (state is AuthSmsCodeAllowedToPush) {
            context.read<RouteImpl>().go(MapRoutes.map.name);
          }
        },
        builder: (context, state) {
          return AuthScaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25, top: 50),
                        child: Image.asset(
                          '${AppConstants.icons}logo_medium.png',
                        ),
                      ),
                      AuthBodyContainer(
                        title: 'Вход по смс',
                        subTitle: "Введите код из смс",
                        buttonTitle: 'Получить код повторно',
                        height: 310,
                        onTap: () => context.read<AuthSmsCodeBloc>().add(AuthSmsGetCode()),
                        body: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Pinput(
                              defaultPinTheme: PinTheme(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  height: 42,
                                  width: 36,
                                  textStyle: const TextStyle(
                                      color: Color(0xFFEF37A5),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                  decoration: BoxDecoration(
                                      color: Colors.white, borderRadius: BorderRadius.circular(8))),
                              onCompleted: (pin) => context
                                  .read<AuthSmsCodeBloc>()
                                  .add(AuthSmsCodeInputValue(pin, true)),
                              onChanged: (pin) => context
                                  .read<AuthSmsCodeBloc>()
                                  .add(AuthSmsCodeInputValue(pin, false)),
                            ),
                          ),
                          state.pageState.errMsg.isNotEmpty && state is AuthSmsCodeError
                              ? Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Text(
                                    state.pageState.errMsg,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFEF37A5)),
                                  ),
                                )
                              : const SizedBox(
                                  height: 19,
                                ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Column(
                          children: [
                            AuthCustomTextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              text: 'Вернуться назад',
                              prefIcon: const CustomSvgImageAsset(image: 'auth_back_icon.svg'),
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                            Container(
                              height: 60,
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 2,
                                        color: Colors.white.withOpacity(0.3),
                                      ),
                                      borderRadius: BorderRadius.circular(44))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Нет аккаунта? ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  AuthCustomTextButton(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    onPressed: () => context.read<RouteImpl>().pushAndReplace(
                                        'auth/${RootRoutes.registrationPhone.name}'),
                                    text: 'Зарегистрироваться',
                                    isUnderline: true,
                                    innerPadding: const EdgeInsets.all(0),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
