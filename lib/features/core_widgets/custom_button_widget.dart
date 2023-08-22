import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.backgroundColor,
      required this.widthPadding});

  final VoidCallback onPressed;
  final String title;
  final Color backgroundColor;
  final double widthPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widthPadding),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          //() { Navigator.pushNamed(context, '/auth_password_page');},
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18))),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w300,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}



/* 
class AuthCustomButton extends StatefulWidget {
  const AuthCustomButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  State<AuthCustomButton> createState() => _AuthCustomButtonState();
}

class _AuthCustomButtonState extends State<AuthCustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 87),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          onPressed: widget.onTap,
            //() { Navigator.pushNamed(context, '/auth_password_page');},
          
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
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
    );
  }
}
 */

