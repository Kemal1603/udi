import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final String icon;
  final Color? iconColor;
  final Function() onTap;
  final EdgeInsets? padding;
  final bool hasIndicator;

  const AppIconButton({
    required this.icon,
    required this.onTap,
    this.padding,
    this.iconColor,
    this.hasIndicator = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppDimens.PADDING_4),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.only(
              left: AppDimens.PADDING_8,
              right: AppDimens.PADDING_8,
              top: AppDimens.PADDING_8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: icon.isNotEmpty
                      ? AppIconSvg.asset(
                          icon,
                          color: iconColor,
                        )
                      : Image.asset(icon),
                ),
                const SizedBox(height: AppDimens.ITEM_SIZE_4),
                if (hasIndicator)
                  Container(
                    color: AppColors.of(context).alizarin,
                    height: AppDimens.ITEM_SIZE_1,
                    width: AppDimens.ITEM_SIZE_20,
                  ),
                if (!hasIndicator) const SizedBox(height: AppDimens.ITEM_SIZE_1)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
