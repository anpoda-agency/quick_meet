import 'package:flutter/material.dart';

class AuthLogoAreaWidget extends StatelessWidget {
  const AuthLogoAreaWidget({
    super.key,
    required this.heightRatioRelativeScreen,
  });

  final double heightRatioRelativeScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * heightRatioRelativeScreen,
      decoration: const ShapeDecoration(
        color: Color(0xFF6B4EFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 15,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
    );
  }
}
