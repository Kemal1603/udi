import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  final double height;
  final EdgeInsets margin;

  const CustomDivider({
    this.color,
    this.height = 1,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color ?? AppColors.of(context).gray,
      margin: margin,
      width: double.infinity,
    );
  }
}

class CustomTitledDivider extends StatelessWidget {
  final String? text;

  const CustomTitledDivider({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Flexible(child: CustomDivider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_8),
          child: Text(
            text ?? '',
            style: AppFonts.normal16.copyWith(
              color: AppColors.of(context).textGrey,
            ),
          ),
        ),
        const Flexible(child: CustomDivider()),
      ],
    );
  }
}
