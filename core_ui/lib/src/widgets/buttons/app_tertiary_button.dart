import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTertiaryButton extends StatefulWidget {
  final String? text;
  final Color? color;
  final void Function()? onPressed;
  final bool isDisabled;
  final TextStyle? textStyle;

 const  AppTertiaryButton({
    super.key,
    this.color,
    this.text,
    this.onPressed,
    this.isDisabled = false,
    this.textStyle  ,
  });

  @override
  State<AppTertiaryButton> createState() => _AppTertiaryButtonState();
}

class _AppTertiaryButtonState extends State<AppTertiaryButton> {
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);
    Function()? onTap;
    TextStyle textStyle;
    if (widget.isDisabled) {
      onTap = null;
      textStyle = (widget.textStyle ??  AppFonts.normal16).copyWith(color: colors.alizarin10);
    } else if (_isHovered) {
      onTap = widget.onPressed;
      textStyle = (widget.textStyle ??  AppFonts.normal16).copyWith(color: colors.alizarinHovered);
    } else {
      textStyle = (widget.textStyle ??  AppFonts.normal16).copyWith(color: colors.alizarin);
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
        child: Center(
          child: Text(
            widget.text ?? '',
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
