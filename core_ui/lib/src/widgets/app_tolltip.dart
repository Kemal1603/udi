import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import '../../core_ui.dart';

class AppTooltip extends StatelessWidget {
  final Widget child;
  final String tooltip;

  const AppTooltip({
    required this.child,
    required this.tooltip,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JustTheTooltip(
      child: child,
      preferredDirection: AxisDirection.up,
      tailBaseWidth: AppDimens.PADDING_10,
      tailLength: AppDimens.PADDING_6,
      backgroundColor: AppColors.of(context).alizarin,
      content: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.PADDING_8,
          vertical: AppDimens.PADDING_4,
        ),
        child: Text(
          tooltip,
          style: AppFonts.normal14.copyWith(color: AppColors.of(context).white),
        ),
      ),
    );
  }
}
