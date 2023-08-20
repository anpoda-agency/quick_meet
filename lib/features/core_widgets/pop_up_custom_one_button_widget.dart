import 'package:flutter/material.dart';

class PopUpCustomOneButtonWidget {
  const PopUpCustomOneButtonWidget({
    required this.popUpMessage,
    required this.buttonTitle,
    required this.onPressed,
    //this.enabledChoiceButtonsPopUp = false,
  }); // : secondButtonOnPressed = secondButtonOnPressed ?? (() {});

  final String popUpMessage;
  final String buttonTitle;
  //final VoidCallback firstButtonOnPressed;
  final Function() onPressed;
  //final bool enabledChoiceButtonsPopUp;

// Попов в телегу скинул пример как на работе у них делают, можно stateless выкинуть и все

  Future<void> popUpCustomWidgetOneButton(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          //Navigator.pushNamed(context, '/auth_sms_code_page');
                          //    context, '/auth_sms_code_page');
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                        ),
                        child: Text(
                          buttonTitle,
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
