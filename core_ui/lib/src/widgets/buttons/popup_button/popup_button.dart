import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

final class PopupMenuElement {
  final String? icon;
  final String title;
  final VoidCallback onTap;
  final EdgeInsets? padding;
  final bool enabled;
  final String? tooltip;

  PopupMenuElement({
    required this.onTap,
    required this.title,
    this.icon,
    this.padding,
    this.enabled = true,
    this.tooltip,
  });
}

class PopupMenuButtonWidget extends StatelessWidget {
  final Widget button;
  final List<PopupMenuElement> actions;
  final EdgeInsets? padding;

  const PopupMenuButtonWidget({
    required this.button,
    required this.actions,
    this.padding,
    Key? key,
  }) : super(key: key);

  PopupMenuItem<int> _actionsBuilder(PopupMenuElement element, AppColors colors) {
    return PopupMenuItem<int>(
      value: element.onTap.hashCode,
      height: AppDimens.ITEM_SIZE_40,
      child: AppTooltip(
        tooltip: element.tooltip ?? element.title,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: AppDimens.ITEM_SIZE_60,
              child: AppImage(
                image: element.icon ?? '',
                color: element.enabled ? colors.matterhorn : colors.philippineSilver,
              ),
            ),
            Text(
              element.title,
              style: element.enabled
                  ? AppFonts.normal20.copyWith(color: colors.matterhorn)
                  : AppFonts.normal20.copyWith(color: colors.philippineSilver),
            ),
          ],
        ),
      ),
      enabled: element.enabled,
      padding: element.padding ?? EdgeInsets.all(0),
      onTap: element.onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);
    return Theme(
      data: Theme.of(context).copyWith(
        hoverColor: colors.alizarin5,
        dividerTheme: DividerThemeData(
          color: colors.gainsboroLight.withOpacity(0.5),
        ),
        popupMenuTheme: PopupMenuThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.RADIUS_5),
          ),
        ),
      ),
      child: PopupMenuButton<int>(
        surfaceTintColor: colors.white,
        padding: padding ?? EdgeInsets.all(0),
        itemBuilder: (BuildContext context) {
          final List<PopupMenuEntry<int>> _elements = <PopupMenuEntry<int>>[];
          int _dividerCount = actions.length - 1;
          for (final PopupMenuElement element in actions) {
            _elements.add(_actionsBuilder(element, colors));
            if (_dividerCount > 0) {
              _elements.add(PopupMenuDivider(
                height: 1,
              ));
              _dividerCount--;
            }
          }

          return _elements;
        },
        icon: button,
        position: PopupMenuPosition.under,
      ),
    );
  }
}
