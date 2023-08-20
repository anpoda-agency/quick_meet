import 'package:flutter/material.dart';

class AuthCustomTextFieldWidget extends StatefulWidget {
  const AuthCustomTextFieldWidget({
    super.key,
    required this.textFieldTitle,
  });

  final String textFieldTitle;

  @override
  State<AuthCustomTextFieldWidget> createState() =>
      _AuthCustomTextFieldWidgetState();
}

class _AuthCustomTextFieldWidgetState extends State<AuthCustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              widget.textFieldTitle,
              //'Номер телефона',
              style: const TextStyle(
                color: Color(0xFF505050),
                fontSize: 16,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w300,
                letterSpacing: 0.80,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide:
                      const BorderSide(width: 0.50, color: Color(0xFF6B4EFF)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide:
                      const BorderSide(width: 0.50, color: Color(0xFF6B4EFF)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
