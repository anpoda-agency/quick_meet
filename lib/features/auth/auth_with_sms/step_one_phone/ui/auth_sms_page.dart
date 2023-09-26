import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quick_meet/core/constants.dart';
import 'package:quick_meet/domain/repository/activation_code_repository.dart';
import 'package:quick_meet/domain/router/route_constants.dart';
import 'package:quick_meet/domain/router/route_impl.dart';
import 'package:quick_meet/features/auth/auth_with_sms/step_one_phone/bloc/auth_with_sms_bloc.dart';
import 'package:quick_meet/features/core_widgets/auth_widgets/auth_body_container.dart';
import 'package:quick_meet/features/core_widgets/auth_widgets/auth_custom_text_button.dart';
import 'package:quick_meet/features/core_widgets/auth_widgets/auth_scaffold.dart';
import 'package:quick_meet/features/core_widgets/auth_widgets/auth_text_form_field.dart';
import 'package:quick_meet/features/core_widgets/svg_image.dart';

class AuthSmsPage extends StatefulWidget {
  const AuthSmsPage({super.key});

  @override
  State<AuthSmsPage> createState() => _AuthSmsPageState();
}

class _AuthSmsPageState extends State<AuthSmsPage> {
  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
      mask: "+7 (###) ###-##-##",
      filter: {
        "#": RegExp(r'[0-9]'),
      },
      type: MaskAutoCompletionType.lazy);

  final FocusNode _focusNodePhone = FocusNode();

  final TextEditingController _controllerPhoneHint = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();

  String mask = '+7 (000) 000-00-00';

  @override
  void initState() {
    _controllerPhone.text = '+7 (';
    _controllerPhoneHint.text = '+7 (000) 000-00-00';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthWithSmsBloc(
        activationCodeRepository: context.read<GetIt>().get<ActivationCodeRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<AuthWithSmsBloc, AuthWithSmsState>(
        listener: (context, state) {
          if (state is AuthWithSmsAllowedToPush) {
            context.read<RouteImpl>().push('auth/${RootRoutes.authWithSmsCode.name}',
                args: state.pageState.request.source);
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
                        subTitle: "Введите номер телефона",
                        buttonTitle: 'Получить код',
                        height: 310,
                        onTap: () => context.read<AuthWithSmsBloc>().add(AuthWithSmsSendPhone()),
                        body: [
                          SizedBox(
                            width: 240,
                            child: Stack(
                              children: [
                                IgnorePointer(
                                  child: AuthTextFormField(
                                    height: 50,
                                    withoutBorder: true,
                                    controller: _controllerPhoneHint,
                                    inputFormatters: [maskFormatter],
                                    keyboardType: TextInputType.phone,
                                    errorText: state.pageState.errMsg,
                                    isErrorState: state.pageState.phoneError,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white.withOpacity(0.6),
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.none,
                                      decorationThickness: 0,
                                    ),
                                  ),
                                ),
                                AuthTextFormField(
                                  height: 50,
                                  withoutBorder: true,
                                  inputFormatters: [maskFormatter],
                                  keyboardType: TextInputType.phone,
                                  errorText: state.pageState.errMsg,
                                  isErrorState: state.pageState.phoneError,
                                  maxLines: 1,
                                  onChanged: (value) {
                                    context
                                        .read<AuthWithSmsBloc>()
                                        .add(AuthWithSmsEnterPhone(value));
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
                                            String formattedMask = _controllerPhoneHint.text
                                                .replaceRange(i, i + 1, value[i]);
                                            _controllerPhoneHint.text = formattedMask;
                                          });
                                        } else if (_controllerPhoneHint.text.length >
                                                value.length &&
                                            value.isNotEmpty) {
                                          setState(() {
                                            _controllerPhoneHint.text =
                                                value.substring(0, value.length - 1) +
                                                    mask.substring(value.length - 1);
                                          });
                                        }
                                      }
                                    }
                                  },
                                  controller: _controllerPhone,
                                  focusNode: _focusNodePhone,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.none,
                                    decorationThickness: 0,
                                  ),
                                ),
                              ],
                            ),
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
