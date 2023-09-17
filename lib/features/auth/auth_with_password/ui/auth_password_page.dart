import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quick_meet/core/constants.dart';
import 'package:quick_meet/domain/repository/auth_repository.dart';
import 'package:quick_meet/domain/repository/user_repository.dart';
import 'package:quick_meet/domain/router/route_constants.dart';
import 'package:quick_meet/domain/router/route_impl.dart';
import 'package:quick_meet/features/auth/auth_with_password/bloc/auth_password_bloc.dart';
import 'package:quick_meet/features/core_widgets/auth_widgets/auth_custom_button.dart';
import 'package:quick_meet/features/core_widgets/auth_widgets/auth_custom_text_button.dart';
import 'package:quick_meet/features/core_widgets/auth_widgets/auth_scaffold.dart';
import 'package:quick_meet/features/core_widgets/auth_widgets/auth_text_form_field.dart';
import 'package:quick_meet/features/core_widgets/svg_image.dart';

class AuthPasswordPage extends StatefulWidget {
  const AuthPasswordPage({super.key});

  @override
  State<AuthPasswordPage> createState() => _AuthPasswordPageState();
}

class _AuthPasswordPageState extends State<AuthPasswordPage> {
  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
      mask: "+7 (###) ###-##-##",
      filter: {
        "#": RegExp(r'[0-9]'),
      },
      type: MaskAutoCompletionType.lazy);

  final FocusNode _focusNodePhone = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();

  final TextEditingController _controllerPhoneHint = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  String mask = '+7 (000) 000-00-00';

  @override
  void initState() {
    _focusNodePhone.addListener(() {
      mounted
          ? setState(() {
              if (_focusNodePhone.hasFocus) {
                if (_controllerPhone.text != '+7 (' && _controllerPhone.text.isEmpty) {
                  _controllerPhone.text = '+7 (';
                  _controllerPhoneHint.text = '+7 (000) 000-00-00';
                }
              } else if (_controllerPhone.text == '+7 (') {
                _controllerPhone.clear();
                _controllerPhoneHint.clear();
              } else if (_controllerPhone.text.isEmpty) {
                _controllerPhoneHint.clear();
              }
            })
          : null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthPasswordBloc(
        authRepository: context.read<GetIt>().get<AuthRepository>(),
        userRepository: context.read<GetIt>().get<UserRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<AuthPasswordBloc, AuthPasswordState>(
        listener: (context, state) {
          if (state is AuthPasswordAllowedToPush) {
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
                      Container(
                        height: 430,
                        padding: const EdgeInsets.all(30),
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: const Alignment(0.61, 0.8),
                            end: const Alignment(-0.61, -0.8),
                            colors: [
                              Colors.white.withOpacity(0.05),
                              Colors.white.withOpacity(0.25),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: Colors.white.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Вход с паролем',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Stack(
                              children: [
                                IgnorePointer(
                                  child: AuthTextFormField(
                                    controller: _controllerPhoneHint,
                                    inputFormatters: [maskFormatter],
                                    keyboardType: TextInputType.phone,
                                    errorText: 'Некорректный номер телефона',
                                    isErrorState: state.pageState.phoneError,
                                    label: '',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white.withOpacity(0.6),
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                      decorationThickness: 0,
                                    ),
                                  ),
                                ),
                                AuthTextFormField(
                                  inputFormatters: [maskFormatter],
                                  keyboardType: TextInputType.phone,
                                  errorText: 'Некорректный номер телефона',
                                  isErrorState: state.pageState.phoneError,
                                  label: 'Телефон',
                                  maxLines: 1,
                                  onChanged: (value) {
                                    context.read<AuthPasswordBloc>().add(AuthPasswordInputNumber(value));
                                    if (value.isEmpty) {
                                      _controllerPhone.text = '+7 (';
                                      _controllerPhoneHint.text = '+7 (000) 000-00-00';
                                      setState(() {
                                        mask = '+7 (000) 000-00-00';
                                      });
                                    } else {
                                      for (var i = 0; i < value.length; i++) {
                                        if (_controllerPhoneHint.text[i] != value[i]) {
                                          setState(() {
                                            String formattedMask =
                                                _controllerPhoneHint.text.replaceRange(i, i + 1, value[i]);
                                            _controllerPhoneHint.text = formattedMask;
                                          });
                                        } else if (_controllerPhoneHint.text.length > value.length &&
                                            value.isNotEmpty) {
                                          setState(() {
                                            _controllerPhoneHint.text =
                                                value.substring(0, value.length - 1) + mask.substring(value.length - 1);
                                          });
                                        }
                                      }
                                    }
                                  },
                                  controller: _controllerPhone,
                                  focusNode: _focusNodePhone,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                    decorationThickness: 0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                            AuthTextFormFieldPassword(
                              errorText: state.pageState.passwordErrorText,
                              isErrorState: state.pageState.passwordError,
                              label: 'Пароль',
                              maxLines: 1,
                              onChanged: (value) =>
                                  context.read<AuthPasswordBloc>().add(AuthPasswordInputPassword(value)),
                              controller: _controllerPassword,
                              focusNode: _focusNodePassword,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                                decorationThickness: 0,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AuthCustomTextButton(
                              onPressed: () =>
                                  context.read<RouteImpl>().push('auth/${RootRoutes.resetPasswordPhone.name}'),
                              text: 'Забыли пароль?',
                              isUnderline: true,
                            ),
                            const SizedBox(
                              height: 34,
                            ),
                            CustomButton(
                                onTap: () => context.read<AuthPasswordBloc>().add(AuthPasswordSendLogin()),
                                text: 'Войти')
                          ],
                        ),
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
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                                  ),
                                  AuthCustomTextButton(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    onPressed: () => context
                                        .read<RouteImpl>()
                                        .pushAndReplace('auth/${RootRoutes.registrationPhone.name}'),
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

  @override
  void dispose() {
    _controllerPhoneHint.removeListener(() {});
    _controllerPhone.dispose();
    _controllerPassword.dispose();
    _controllerPhoneHint.dispose();
    super.dispose();
  }
}
