import 'package:flutter/material.dart';
import 'package:quick_meet/features/core_widgets/auth_logo_area_widget.dart';
import 'package:quick_meet/features/core_widgets/auth_main_custom_label_widget.dart';

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
                const SizedBox(
                  width: 271,
                  child: Text(
                    'Придумайте пароль',
                    style: TextStyle(
                      color: Color(0xFF505050),
                      fontSize: 16,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.80,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: 285,
                  height: 50,
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      /* //isDense: true,
                      //contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      // новый бордер
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                            width: 0.50, color: Color(0xFF6B4EFF)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                            width: 0.50, color: Color(0xFF6B4EFF)),
                      ), */
                      errorText: // 'Не менее 6 символов'
                          _passwordIsShort ? 'Не менее 6 символов' : null,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                            width: 0.50, color: Color(0xFF6B4EFF)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                            width: 0.50, color: Color(0xFF6B4EFF)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const SizedBox(
                  width: 271,
                  child: Text(
                    'Повторите пароль',
                    style: TextStyle(
                      color: Color(0xFF505050),
                      fontSize: 16,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.80,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: 285,
                  height: 50,
                  child: TextField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      errorText:
                          _confirmPasswordError ? 'Пароли не совпадают' : null,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                            width: 0.50, color: Color(0xFF6B4EFF)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                            width: 0.50, color: Color(0xFF6B4EFF)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: 285,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF5F5F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: ElevatedButton(
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF5F5F5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                      ),
                      child: const Text(
                        'Продолжить',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                      )),
                ),
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
