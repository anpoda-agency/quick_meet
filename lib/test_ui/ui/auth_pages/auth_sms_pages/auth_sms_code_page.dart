import 'package:flutter/material.dart';
import 'package:quick_meet/features/core_widgets/pop_up_custom_widget.dart';

class AuthSmsCodePage extends StatefulWidget {
  const AuthSmsCodePage({super.key});

  @override
  State<AuthSmsCodePage> createState() => _AuthSmsCodePageState();
}

class _AuthSmsCodePageState extends State<AuthSmsCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 251,
            child: Text(
              'Код подтверждения',
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
            height: 14,
          ),
          Center(
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 10,
              direction: Axis.horizontal,
              runSpacing: 10,
              children: [
                _otpTextField(context, true),
                _otpTextField(context, false),
                _otpTextField(context, false),
                _otpTextField(context, false),
              ],
            ),
          ),
          const SizedBox(
            height: 37,
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
                  //Navigator.pushNamed(context, '/auth_sms_code_page');
                  // пока пусть по нажатию кнопки будет поп ап об ошибке выскакивать
                  const PopUpCustomWidget();
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
        ],
      ),
      //),
    );
  }
}

Widget _otpTextField(BuildContext context, bool autoFocus) {
  return Container(
    width: 62,
    height: 100,
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFF6B4EFF)),
        borderRadius: BorderRadius.circular(18),
      ),
    ),
    child: AspectRatio(
      aspectRatio: 1,
      child: TextField(
        autofocus: autoFocus,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          fontSize: 50,
        ),
        maxLines: 1,
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    ),
  );
}
