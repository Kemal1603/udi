import 'package:flutter/material.dart';

import '../../core_ui.dart';

class AppDivider extends StatelessWidget {
  final Color? color;
  final double? width;

  const AppDivider({
    this.color,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: AppDimens.ITEM_SIZE_1,
      color: color ?? AppColors.of(context).darkGray,
    );
  }
}
