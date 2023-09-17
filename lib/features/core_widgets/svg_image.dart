import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_meet/core/constants.dart';

class CustomSvgImageAsset extends StatelessWidget {
  const CustomSvgImageAsset({
    required this.image,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.color,
    super.key,
  });

  final String image;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppConstants.icons + image,
      width: width,
      height: height,
      fit: fit,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
