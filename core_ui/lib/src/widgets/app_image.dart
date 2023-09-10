import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageType {
  svg,
  other,
  network,
}

class AppImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String image;
  final TextStyle? textStyle;
  final BorderRadius borderRadius;
  final BoxFit? fit;
  final Color? color;

  const AppImage({
    required this.image,
    this.textStyle,
    this.height,
    this.width,
    this.color,
    this.borderRadius = BorderRadius.zero,
    this.fit,
    Key? key,
  }) : super(key: key);

  ImageType _getImageType(String fileName) {
    if (fileName.isNetworkImage()) {
      return ImageType.network;
    }
    if (fileName.isSvg()) {
      return ImageType.svg;
    }
    return ImageType.other;
  }

  Widget _buildImage(BuildContext context) {
    switch (_getImageType(image)) {
      case ImageType.svg:
        return ClipRRect(
          borderRadius: borderRadius,
          child: SizedBox(
            height: height,
            width: width,
            child: SvgPicture.asset(
              image,
              fit: fit ?? BoxFit.contain,
              color: color,
            ),
          ),
        );
      case ImageType.other:
        return ClipRRect(
          borderRadius: borderRadius,
          child: SizedBox(
            height: height,
            width: width,
            child: Image.asset(
              image,
              fit: fit,
            ),
          ),
        );
      case ImageType.network:
        return ClipRRect(
          borderRadius: borderRadius,
          child: CachedNetworkImage(
            fadeInDuration: const Duration(milliseconds: 300),
            imageUrl: image,
            placeholder: (_, __) => Container(color: AppColors.of(context).gray),
            errorWidget: (_, __, ___) => Container(color: AppColors.of(context).gray),
            fit: fit,
            width: width,
            height: height,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildImage(context);
  }
}
