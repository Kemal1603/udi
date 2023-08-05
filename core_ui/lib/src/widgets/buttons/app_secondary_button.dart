import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppSecondaryButton extends StatefulWidget {
  final String? image;
  final Widget? child;
  final void Function()? onPressed;
  final bool isDisabled;

  const AppSecondaryButton({
    super.key,
    this.image,
    this.onPressed,
    this.isDisabled = false,
    this.child,
  });

  @override
  State<AppSecondaryButton> createState() => _AppSecondaryButtonState();
}

class _AppSecondaryButtonState extends State<AppSecondaryButton> {
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);
    Color? backgroundColor;
    Function()? onTap;
    if (widget.isDisabled) {
      backgroundColor = colors.transparent;
      onTap = null;
    } else if (_isHovered) {
      backgroundColor = colors.alizarin10;
      onTap = widget.onPressed;
    } else {
      backgroundColor = colors.alizarin5;
      onTap = widget.onPressed;
    }
    return InkWell(
      onHover: (bool isHovered) => _onHover(isHovered),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppDimens.PADDING_10,
          horizontal: AppDimens.PADDING_10,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_8),
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}
