import 'package:flutter/material.dart';

class CustomButtonMorfy extends StatelessWidget {
  const CustomButtonMorfy({
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
            gradient: LinearGradient(
              begin: const Alignment(0.99, -0.10),
              end: const Alignment(-0.99, 0.1),
              colors: [
                const Color(0xFFCECECE).withOpacity(0.2),
                Colors.white.withOpacity(0.35),
              ],
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.white.withOpacity(0.3),
              ),
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
                Text(
                  text ?? '',
                  style: const TextStyle(
                    color: Colors.white,
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
