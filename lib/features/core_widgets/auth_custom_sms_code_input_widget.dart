import 'package:flutter/material.dart';

class AuthCustomSmsCodeInputWidget extends StatefulWidget {
  const AuthCustomSmsCodeInputWidget({
    super.key,
    required this.onChanged,
  });

  final Function(String) onChanged;

  @override
  State<AuthCustomSmsCodeInputWidget> createState() =>
      _AuthCustomSmsCodeInputWidgetState();
}

class _AuthCustomSmsCodeInputWidgetState
    extends State<AuthCustomSmsCodeInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
              _otpTextField(
                  context: context,
                  autoFocus: true,
                  onChange: widget.onChanged),
              _otpTextField(
                  context: context,
                  autoFocus: true,
                  onChange: widget.onChanged),
              _otpTextField(
                  context: context,
                  autoFocus: true,
                  onChange: widget.onChanged),
              _otpTextField(
                  context: context,
                  autoFocus: true,
                  onChange: widget.onChanged),
            ],
          ),
        ),
        const SizedBox(
          height: 37,
        ),
      ],
    );
  }
}

Widget _otpTextField(
    {required BuildContext context,
    required bool autoFocus,
    required Function(String value) onChange}) {
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
          onChange(value);
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    ),
  );
}
