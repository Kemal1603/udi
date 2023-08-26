import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String? image;
  final TextStyle? textStyle;
  final String? text;
  final Widget? childWidget;
  final Color? color;
  final double radius;
  final Color? borderColor;
  final Color? hoveredBackgroundColor;
  final double? borderWidth;
  final Color? overlayColor;
  final double verticalPadding;
  final void Function()? onPressed;
  final bool isDisabled;
  final bool isLoading;

  const AppButton({
    super.key,
    this.color,
    this.radius = 8,
    this.verticalPadding = 0,
    this.text,
    this.childWidget,
    this.borderColor,
    this.borderWidth,
    this.overlayColor,
    this.textStyle,
    this.image,
    this.onPressed,
    this.hoveredBackgroundColor,
    this.isDisabled = false,
    this.isLoading = false,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
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
    Color bordersColor = Colors.transparent;
    Widget child;
    if (widget.isDisabled) {
      backgroundColor = widget.color ?? colors.alizarin10;
      onTap = null;
      child = widget.text != null ? _textWidget(context) : widget.childWidget ?? const SizedBox();
    } else if (_isHovered) {
      backgroundColor = widget.hoveredBackgroundColor ?? colors.alizarinHovered;
      child = widget.text != null ? _textWidget(context) : widget.childWidget ?? const SizedBox();
      onTap = widget.onPressed;
    } else if (widget.isLoading) {
      backgroundColor = colors.alizarin10;
      onTap = null;
      child = _loadingWidget();
    } else {
      backgroundColor = widget.color ?? colors.alizarin10;
      onTap = widget.onPressed;
      bordersColor = (widget.borderColor == null) ? colors.alizarin : widget.borderColor!;
      child = widget.text != null ? _textWidget(context) : widget.childWidget ?? const SizedBox();
    }

    return InkWell(
      onHover: _onHover,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: widget.verticalPadding,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(widget.radius),
          border: Border.all(
            width: (widget.borderWidth == null) ? 0 : widget.borderWidth!,
            color: bordersColor,
          ),
        ),
        child: Center(child: child),
      ),
    );
  }

  Widget _textWidget(BuildContext context) {
    return Center(
      child: Text(
        widget.text ?? '',
        style: widget.textStyle ??
            AppFonts.normal20.copyWith(
              color: AppColors.of(context).white,
            ),
      ),
    );
  }

  Widget _loadingWidget() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
