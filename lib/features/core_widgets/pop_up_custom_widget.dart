import 'package:flutter/material.dart';

class PopUpCustomWidget {
  const PopUpCustomWidget({
    required this.popUpMessage,
    required this.firstButtonTitle,
    this.secondButtonTitle = '',
    required this.firstButtonOnPressed,
    this.secondButtonOnPressed,
  }); // : secondButtonOnPressed = secondButtonOnPressed ?? (() {});

  final String popUpMessage;
  final String firstButtonTitle;
  final String secondButtonTitle;
  final VoidCallback firstButtonOnPressed;
  final Function()? secondButtonOnPressed;

// Попов в телегу скинул пример как на работе у них делают, можно stateless выкинуть и все

  Future<void> popUpCustomWidget(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        backgroundColor: Color(0xFF6B4EFF),
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: 341,
          height: 247,
          child: Column(
            children: [
              const SizedBox(
                height: 61,
              ),
              SizedBox(
                width: 341,
                child: Text(
                  popUpMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.40,
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
                      //Navigator.pushNamed(
                      //    context, '/auth_sms_code_page');
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                    ),
                    child: Text(
                      firstButtonTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
        //),
      ),
    );
  }
}


/* return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        backgroundColor: Color(0xFF6B4EFF),
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: 341,
          height: 247,
          child: Column(
            children: [
              const SizedBox(
                height: 61,
              ),
              const SizedBox(
                width: 341,
                child: Text(
                  'Неверный код доступа',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.40,
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
                      //Navigator.pushNamed(
                      //    context, '/auth_sms_code_page');
                      Navigator.of(context).pop();
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
        //),
      ),
    ); */