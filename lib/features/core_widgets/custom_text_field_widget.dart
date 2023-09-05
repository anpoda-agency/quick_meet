import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.textFieldTitle,
    required this.onChanged,
    this.keyboardType,
    this.controller,
    this.errorText,
    this.inputFormatter,
    this.initialValue,
  });

  final String textFieldTitle;
  final Function(String) onChanged;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? errorText;
  final String? initialValue;
  final List<MaskTextInputFormatter>? inputFormatter;

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
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
            child: TextFormField(
              initialValue: widget.initialValue,
              inputFormatters: widget.inputFormatter,
              keyboardType: widget.keyboardType,
              onChanged: widget.onChanged,
              controller: widget.controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(width: 0.50, color: Color(0xFF6B4EFF)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(width: 0.50, color: Color(0xFF6B4EFF)),
                ),
                errorText: widget.errorText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
