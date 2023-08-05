import 'package:core_ui/src/widgets/buttons/radio_button/radio.dart';
import 'package:flutter/material.dart';

enum _RadioType { material, adaptive }

class CustomRadioListTile<T> extends StatelessWidget {
  const CustomRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.key,
    this.mouseCursor,
    this.toggleable = false,
    this.activeColor,
    this.fillColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.title,
    this.subtitle,
    this.isThreeLine = false,
    this.dense,
    this.secondary,
    this.selected = false,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.autofocus = false,
    this.contentPadding,
    this.shape,
    this.tileColor,
    this.selectedTileColor,
    this.visualDensity,
    this.focusNode,
    this.onFocusChange,
    this.enableFeedback,
    this.buttonBorderColor,
    this.buttonFillColor,
  })  : _radioType = _RadioType.material,
        assert(!isThreeLine || subtitle != null);

  const CustomRadioListTile.adaptive({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.key,
    this.mouseCursor,
    this.toggleable = false,
    this.activeColor,
    this.fillColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.title,
    this.subtitle,
    this.isThreeLine = false,
    this.dense,
    this.secondary,
    this.selected = false,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.autofocus = false,
    this.contentPadding,
    this.shape,
    this.tileColor,
    this.selectedTileColor,
    this.visualDensity,
    this.focusNode,
    this.onFocusChange,
    this.enableFeedback,
    this.buttonBorderColor,
    this.buttonFillColor,
  })  : _radioType = _RadioType.adaptive,
        assert(!isThreeLine || subtitle != null);

  final T value;

  final T? groupValue;

  final Color? buttonBorderColor;
  final Color? buttonFillColor;

  final ValueChanged<T?>? onChanged;

  final MouseCursor? mouseCursor;

  final bool toggleable;

  final Color? activeColor;

  final MaterialStateProperty<Color?>? fillColor;

  final MaterialTapTargetSize? materialTapTargetSize;

  final Color? hoverColor;

  final MaterialStateProperty<Color?>? overlayColor;

  final double? splashRadius;

  final Widget? title;

  final Widget? subtitle;

  final Widget? secondary;

  final bool isThreeLine;

  final bool? dense;

  final bool selected;

  final ListTileControlAffinity controlAffinity;

  final bool autofocus;

  final EdgeInsetsGeometry? contentPadding;

  bool get checked => value == groupValue;

  final ShapeBorder? shape;

  final Color? tileColor;

  final Color? selectedTileColor;

  final VisualDensity? visualDensity;

  final FocusNode? focusNode;

  final ValueChanged<bool>? onFocusChange;

  final bool? enableFeedback;

  final _RadioType _radioType;

  @override
  Widget build(BuildContext context) {
    final Widget control;
    switch (_radioType) {
      case _RadioType.material:
        control = CustomRadio<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          toggleable: toggleable,
          activeColor: activeColor,
          materialTapTargetSize:
              materialTapTargetSize ?? MaterialTapTargetSize.shrinkWrap,
          autofocus: autofocus,
          fillColor: fillColor,
          mouseCursor: mouseCursor,
          hoverColor: hoverColor,
          overlayColor: overlayColor,
          splashRadius: splashRadius,
          buttonBorderColor: buttonBorderColor,
          buttonFillColor: buttonFillColor,
        );
      case _RadioType.adaptive:
        control = CustomRadio<T>.adaptive(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          toggleable: toggleable,
          activeColor: activeColor,
          materialTapTargetSize:
              materialTapTargetSize ?? MaterialTapTargetSize.shrinkWrap,
          autofocus: autofocus,
          fillColor: fillColor,
          mouseCursor: mouseCursor,
          hoverColor: hoverColor,
          overlayColor: overlayColor,
          splashRadius: splashRadius,
        );
    }

    Widget? leading, trailing;
    switch (controlAffinity) {
      case ListTileControlAffinity.leading:
      case ListTileControlAffinity.platform:
        leading = control;
        trailing = secondary;
      case ListTileControlAffinity.trailing:
        leading = secondary;
        trailing = control;
    }
    final ThemeData theme = Theme.of(context);
    final RadioThemeData radioThemeData = RadioTheme.of(context);
    final Set<MaterialState> states = <MaterialState>{
      if (selected) MaterialState.selected,
    };
    final Color effectiveActiveColor = activeColor ??
        radioThemeData.fillColor?.resolve(states) ??
        theme.colorScheme.secondary;
    return MergeSemantics(
      child: ListTile(
        selectedColor: effectiveActiveColor,
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        isThreeLine: isThreeLine,
        dense: dense,
        enabled: onChanged != null,
        shape: shape,
        tileColor: tileColor,
        selectedTileColor: selectedTileColor,
        onTap: onChanged != null
            ? () {
                if (toggleable && checked) {
                  onChanged!(null);
                  return;
                }
                if (!checked) {
                  onChanged!(value);
                }
              }
            : null,
        selected: selected,
        autofocus: autofocus,
        contentPadding: contentPadding,
        visualDensity: visualDensity,
        focusNode: focusNode,
        onFocusChange: onFocusChange,
        enableFeedback: enableFeedback,
      ),
    );
  }
}
