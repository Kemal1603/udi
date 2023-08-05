import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isDisabled;
  final String? icon;
  final Widget? child;

  const SquareButton({
    this.icon,
    this.child,
    this.isDisabled = false,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);

    return InkWell(
      onTap: () {
        if (!isDisabled) {
          onTap?.call();
        }
      },
      child: Container(
        width: AppDimens.ITEM_SIZE_40,
        height: AppDimens.ITEM_SIZE_40,
        decoration: BoxDecoration(
          color: isDisabled ? colors.alizarin5 : colors.alizarin10,
          borderRadius: BorderRadius.circular(
            AppDimens.BORDER_RADIUS_8,
          ),
        ),
        child: Center(
          child: icon == null
              ? child
              : AppImage(
                  image: icon!,
                  color: isDisabled ? colors.alizarin10 : colors.alizarin,
                ),
        ),
      ),
    );
  }
}
