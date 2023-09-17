import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.text,
    this.icon,
    this.onTap,
    this.height,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.alignment,
    this.fontSize,
    Key? key,
  })  : assert(
          text != null || icon != null,
          'need set text or icon',
        ),
        super(key: key);

  final String? text;
  final Widget? icon;
  final Function()? onTap;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final MainAxisAlignment? alignment;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(44),
      color: Colors.transparent,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? 60,
        child: Ink(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(44),
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(44),
            onTap: onTap,
            child: Row(
              mainAxisAlignment: alignment ?? MainAxisAlignment.center,
              children: [
                icon ?? const SizedBox.shrink(),
                GradientText(
                  text ?? '',
                  colors: const [Color(0xFFF35A7B), Color(0xFF9712AD)],
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
