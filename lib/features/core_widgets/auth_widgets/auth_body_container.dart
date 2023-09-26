import 'package:flutter/material.dart';
import 'package:quick_meet/features/core_widgets/auth_widgets/auth_custom_button.dart';

class AuthBodyContainer extends StatelessWidget {
  const AuthBodyContainer(
      {super.key,
      required this.title,
      required this.buttonTitle,
      this.subTitle,
      this.onTap,
      required this.height,
      required this.body});
  final String title;
  final String? subTitle;
  final String buttonTitle;
  final Function()? onTap;
  final double height;
  final List<Widget> body;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(30),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.61, 0.8),
          end: const Alignment(-0.61, -0.8),
          colors: [
            Colors.white.withOpacity(0.05),
            Colors.white.withOpacity(0.25),
          ],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.white.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (subTitle != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(subTitle ?? '',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white)),
                ),
            ],
          ),
          ...body,
          CustomButton(onTap: onTap, text: buttonTitle)
        ],
      ),
    );
  }
}
