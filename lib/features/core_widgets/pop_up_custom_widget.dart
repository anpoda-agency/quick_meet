import 'package:flutter/material.dart';

class PopUpCustomWidget {
  const PopUpCustomWidget({
    required this.popUpMessage,
    required this.mainButtonTitle,
    this.mainButtonOnPressed,
    this.enabledChoiceButtonsPopUp = false,
  }); // : secondButtonOnPressed = secondButtonOnPressed ?? (() {});

  final String popUpMessage;
  final String mainButtonTitle;
  //final VoidCallback firstButtonOnPressed;
  final Function()? mainButtonOnPressed;
  final bool enabledChoiceButtonsPopUp;

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
        backgroundColor: const Color(0xFF6B4EFF),
        contentPadding: EdgeInsets.zero,
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
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
                if (enabledChoiceButtonsPopUp == false)
                  Container(
                    width: 285,
                    height: 50,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: ElevatedButton(
                        onPressed: mainButtonOnPressed,
                        //() {
                        //Navigator.pushNamed(
                        //    context, '/auth_sms_code_page');
                        //Navigator.of(context).pop();
                        //},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                        ),
                        child: Text(
                          mainButtonTitle,
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
                if (enabledChoiceButtonsPopUp == true)
                  Container(
                    width: 285,
                    height: 50,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: ElevatedButton(
                        onPressed: mainButtonOnPressed,
                        //() {
                        //Navigator.pushNamed(
                        //    context, '/auth_sms_code_page');
                        //Navigator.of(context).pop();
                        //},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                        ),
                        child: Text(
                          mainButtonTitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF6B4EFF),
                            fontSize: 20,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                          ),
                        )),
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 83,
                        height: 35,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                            child: const Text(
                              'Да',
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
                      const SizedBox(
                        width: 44,
                      ),
                      Container(
                        width: 83,
                        height: 35,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              // Navigator.pushNamed(context,
                              //     '/profile_edit_page');
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                            child: const Text(
                              'Нет',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF6B4EFF),
                                fontSize: 15,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.75,
                              ),
                            )),
                      ),
                    ],
                  ),
              ],
            ),
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
