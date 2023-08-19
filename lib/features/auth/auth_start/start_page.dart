import 'package:flutter/material.dart';
import 'package:quick_meet/features/registration/step_one_phone/ui/reg_phone_page.dart';

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
          Container(
            width: MediaQuery.of(context).size.width,
            height: 448,
            decoration: const ShapeDecoration(
              color: Color(0xFF6B4EFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 15,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
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
          Container(
            width: 355,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.20,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0xFF6B4EFF),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 87),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/auth_sms_page');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                ),
                child: const Text(
                  'по смс',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 87),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, //'/reg_phone_page'
                      '/auth_password_page');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                ),
                child: const Text(
                  'с паролем',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 355,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.20,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0xFF6B4EFF),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 335,
            height: 50,
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
                //Navigator.pushNamed(context, '/rep_phone_page');
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const RegPhonePage(
                          // args: listOrdersModels[index].id,
                          )),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
