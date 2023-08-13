import 'package:flutter/material.dart';

class ProfileLogoutPopUp extends StatelessWidget {
  const ProfileLogoutPopUp({super.key});

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
      content: //Scaffold(
          //body:

          SizedBox(
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
                'Вы действительно хотите выйти из\n аккаунта?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.10,
                ),
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            Container(
              width: 163,
              height: 35,
              decoration: ShapeDecoration(
                color: Color(0xFFF5F5F5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/main_page');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF5F5F5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  child: const Text(
                    'Выйти',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFE55F5F),
                      fontSize: 15,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.75,
                    ),
                  )),
            ),
          ],
        ),
      ),
      //),
    );
  }
}
