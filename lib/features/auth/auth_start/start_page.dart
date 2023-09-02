import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_meet/domain/router/route_constants.dart';
import 'package:quick_meet/domain/router/route_impl.dart';
import 'package:quick_meet/features/core_widgets/custom_button_widget.dart';
import 'package:quick_meet/features/core_widgets/auth_logo_area_widget.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AuthLogoAreaWidget(
            heightRatioRelativeScreen: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              children: [
                const Text(
                  'Войти',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF6B4EFF),
                    fontSize: 36,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.80,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButtonWidget(
                  title: 'по смс',
                  backgroundColor: Colors.white,
                  widthPadding: 90,
                  onPressed: () {
                    context.read<RouteImpl>().push('auth/${RootRoutes.authWithSmsPhone.name}');
                    // Navigator.pushNamed(context, '/auth_sms_page');
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonWidget(
                  title: 'с паролем',
                  backgroundColor: Colors.white,
                  widthPadding: 90,
                  onPressed: () {
                    context.read<RouteImpl>().push('auth/${RootRoutes.authWithPassword.name}');
                    // Navigator.pushNamed(context, '/auth_password_page');
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  //width: 335,
                  //height: 20,
                  child: InkWell(
                    child: const Text(
                      'Ещё не зарегистрированы?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF505050),
                        fontSize: 16,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                        letterSpacing: 0.80,
                      ),
                    ),
                    onTap: () {
                      context.read<RouteImpl>().push('auth/${RootRoutes.registrationPhone.name}');
                      //Navigator.pushNamed(context, '/rep_phone_page');
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          const SizedBox.shrink(),
        ],
      ),
    );
  }
}

// dividers
// Container(
          //   width: 355,
          //   decoration: const ShapeDecoration(
          //     shape: RoundedRectangleBorder(
          //       side: BorderSide(
          //         width: 0.20,
          //         strokeAlign: BorderSide.strokeAlignCenter,
          //         color: Color(0xFF6B4EFF),
          //       ),
          //     ),
          //   ),
          // ),