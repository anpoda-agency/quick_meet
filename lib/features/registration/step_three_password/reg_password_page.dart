import 'package:flutter/material.dart';
import 'package:quick_meet/features/core_widgets/auth_logo_area_widget.dart';
import 'package:quick_meet/features/core_widgets/auth_main_custom_label_widget.dart';
import 'package:quick_meet/features/core_widgets/custom_button_widget.dart';
import 'package:quick_meet/features/core_widgets/custom_text_field_widget.dart';

class RegPasswordPage extends StatefulWidget {
  const RegPasswordPage({super.key});

  @override
  State<RegPasswordPage> createState() => _RegPasswordPageState();
}

class _RegPasswordPageState extends State<RegPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _confirmPasswordError = false;
  bool _passwordIsShort = false;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6B4EFF),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/reg_final_page', arguments: {
                  'phone': args,
                  'password': _confirmPasswordController.text
                });
              },
              icon: const Icon(Icons.backup)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  textFieldTitle: 'Придумайте пароль',
                  onChanged: (value) {},
                  controller: _passwordController,
                  errorText: _passwordIsShort ? 'Не менее 6 символов' : null,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFieldWidget(
                  textFieldTitle: 'Повторите пароль',
                  onChanged: (value) {},
                  controller: _confirmPasswordController,
                  errorText:
                      _confirmPasswordError ? 'Пароли не совпадают' : null,
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButtonWidget(
                    onPressed: () {
                      if (_passwordController.text.length >= 6) {
                        setState(() {
                          _passwordIsShort = false;
                        });
                        if (_passwordController.text ==
                            _confirmPasswordController.text) {
                          setState(() {
                            _confirmPasswordError = false;
                            _passwordIsShort = false;
                          });
                          Navigator.pushNamed(context, '/reg_final_page',
                              arguments: {
                                'phone': args,
                                'password': _confirmPasswordController.text
                              });
                        } else {
                          setState(() {
                            _confirmPasswordError = true;
                          });
                        }
                      } else {
                        setState(() {
                          _passwordIsShort = true;
                        });
                      }
                    },
                    title: 'Продолжить',
                    backgroundColor: const Color(0xFFF5F5F5),
                    widthPadding: 50),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
