import 'package:flutter/material.dart';

class PopUpCustomTwoButtonsWidget {
  const PopUpCustomTwoButtonsWidget({
    required this.popUpMessage,
    required this.firstButtonTitle,
    required this.secondButtonTitle,
    required this.firstButtonOnPressed,
    required this.secondButtonOnPressed,

    //this.enabledChoiceButtonsPopUp = false,
  }); // : secondButtonOnPressed = secondButtonOnPressed ?? (() {});

  final String popUpMessage;
  final String firstButtonTitle;
  final String secondButtonTitle;
  //final VoidCallback firstButtonOnPressed;
  final Function() firstButtonOnPressed;
  final Function() secondButtonOnPressed;

  //final bool enabledChoiceButtonsPopUp;

// Попов в телегу скинул пример как на работе у них делают, можно stateless выкинуть и все

  Future<void> showPopUpCustomWTwoButtonsWidget(BuildContext context) {
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
        content: Container(
          decoration: BoxDecoration(
              color: const Color(0xFF6B4EFF),
              borderRadius: BorderRadius.circular(15)),
          //padding: const EdgeInsets.symmetric(vertical: 50),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(
                //   height: 60,
                // ),
                const SizedBox.shrink(),
                SizedBox(
                  //width: 341,
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
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 83,
                      height: 35,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF5F5F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: ElevatedButton(
                          onPressed: firstButtonOnPressed,
                          // () {
                          //   Navigator.pushNamed(context, '/');
                          // },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF5F5F5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                          ),
                          child: Text(
                            firstButtonTitle,
                            //'Да',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
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
                        color: const Color(0xFFF5F5F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: ElevatedButton(
                          onPressed: secondButtonOnPressed,
                          //() {
                          // Navigator.pushNamed(context,
                          //     '/profile_edit_page');
                          //Navigator.of(context).pop();
                          //},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF5F5F5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                          ),
                          child: Text(
                            secondButtonTitle,
                            //'Нет',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
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
                const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        //),
      ),
    );
  }
}
