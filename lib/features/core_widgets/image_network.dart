import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quick_meet/core/constants.dart';

class ImageNetworkWithLoader extends StatelessWidget {
  ImageNetworkWithLoader({
    required this.src,
    this.errorBuilder,
    this.fit,
    this.height,
    this.width,
    this.headers,
    this.radius,
    this.loader = false,
    Key? key,
  }) : super(key: key);

  ImageNetworkWithLoader.withUrl({
    required String src,
    this.errorBuilder,
    this.fit,
    this.height,
    this.width,
    this.headers,
    this.radius,
    this.loader = false,
    Key? key,
  })  : src = AppConstants.baseUrl + src,
        super(key: key);

  final String src;
  final Widget? errorBuilder;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Map<String, String>? headers;
  final double? radius;
  final bool loader;

  final List<String> imageEXT = [
    '.jpg',
    '.jpeg',
    '.png',
    '.bmp',
    '.gif',
    '.bmp',
  ];

  _check(String val) {
    final res = imageEXT.firstWhere((el) => val.toLowerCase().contains(el), orElse: () => '');
    return res.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return (_check(src))
        ? SizedBox(
            width: width,
            height: height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius ?? 0),
              child: CachedNetworkImage(
                imageUrl: src,
                fit: fit,
                width: width,
                height: height,
                httpHeaders: headers,
                errorWidget: (context, obj, sttr) {
                  return errorBuilder ??
                      Icon(
                        Icons.photo,
                        size: (width != null) ? (width! * 0.9) : null,
                      );
                },
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          )
        : errorBuilder ??
            Icon(
              Icons.photo,
              size: (width != null) ? (width! * 0.9) : null,
            );
  }
}

class LogoImage extends StatelessWidget {
  final String src;
  final Widget? errorBuilder;
  final BoxFit? fit;
  final double radius;
  final Color? colorBorder;
  final File? imageFile;
  final Map<String, String>? headers;
  const LogoImage({
    required this.src,
    this.colorBorder,
    this.headers,
    this.imageFile,
    this.errorBuilder,
    this.fit,
    required this.radius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child:
              Container(height: radius, width: radius, color: colorBorder, child: const SizedBox()),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(radius * 0.95),
          child: SizedBox(
            height: radius * 0.95,
            width: radius * 0.95,
            child: (imageFile != null)
                ? Image.file(
                    imageFile!,
                    fit: fit,
                  )
                : ImageNetworkWithLoader(
                    src: src,
                    errorBuilder: errorBuilder,
                    fit: fit,
                    height: radius * 0.95,
                    width: radius * 0.95,
                    headers: headers,
                  ),
          ),
        ),
      ],
    );
  }
}
