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
    return Container(
      width: 335,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_8),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
