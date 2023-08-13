import 'package:flutter/material.dart';

class CreateMeetPopUp extends StatelessWidget {
  const CreateMeetPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      backgroundColor: Color(0xFF6B4EFF),
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 341,
        height: 247,
        child: Column(
          children: [
            const SizedBox(
              height: 61,
            ),
            const SizedBox(
              width: 281,
              child: Text(
                'Вы хотите создать встречу по адресу: \nул. Пушкина, 77?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(
              height: 29,
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
                    Navigator.pushNamed(context, '/auth_sms_code_page');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF5F5F5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  child: const Text(
                    'Отправить еще раз',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6B4EFF),
                      fontSize: 20,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
