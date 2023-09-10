import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CarImage extends StatelessWidget {
  final String imageUrl;

  const CarImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AppImage(
      image: imageUrl,
      fit: BoxFit.cover,
      borderRadius: BorderRadius.circular(8),
    );
  }
}
