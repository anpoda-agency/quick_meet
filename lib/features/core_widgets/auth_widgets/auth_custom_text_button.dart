import 'package:flutter/material.dart';

class AuthCustomTextButton extends StatelessWidget {
  const AuthCustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isUnderline,
    this.textStyle,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.prefIcon,
    this.innerPadding,
    this.width,
  });

  final void Function() onPressed;
  final String text;
  final bool? isUnderline;
  final TextStyle? textStyle;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? prefIcon;
  final EdgeInsetsGeometry? innerPadding;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      highlightColor: Colors.white,
      onTap: onPressed,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: innerPadding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            prefIcon ?? const SizedBox.shrink(),
            SizedBox(
              width: (width == null) ? null : width,
              child: Text(
                text,
                style: textStyle ??
                    TextStyle(
                        fontSize: fontSize ?? 14,
                        fontWeight: fontWeight ?? FontWeight.w400,
                        color: color ?? Colors.white,
                        decoration: isUnderline != null && isUnderline == true ? TextDecoration.underline : null),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
