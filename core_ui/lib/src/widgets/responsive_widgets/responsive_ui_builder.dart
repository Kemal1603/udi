import 'package:flutter/material.dart';

import 'responsive_template_widget.dart';

class ResponsiveUiBuilder extends StatelessWidget {
  static const int _mobileCrossAxisCount = 1;
  static const int _tabletCrossAxisCount = 2;
  static const int _desktopCrossAxisCount = 3;

  final Widget mobileBuilder;
  final Widget tabletBuilder;
  final Widget desktopBuilder;

  const ResponsiveUiBuilder({
    required this.mobileBuilder,
    required this.tabletBuilder,
    required this.desktopBuilder,
    Key? key,
  }) : super(key: key);

  static bool isMobile(BuildContext context) => true;

  static bool isTablet(BuildContext context) => false;
  static bool isDesktop(BuildContext context) => false;

  static int countCrossAxis(BuildContext context) {
    return isMobile(context)
        ? _mobileCrossAxisCount
        : isTablet(context)
            ? _tabletCrossAxisCount
            : _desktopCrossAxisCount;
  }

  static double countRadioButtonHeight(
    BuildContext context, {
    required double mobileHeight,
    required double tabletHeight,
    required double desktopHeight,
  }) {
    return isMobile(context)
        ? mobileHeight
        : isTablet(context)
            ? tabletHeight
            : desktopHeight;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxWidth = constraints.maxWidth;
        final double maxHeight = constraints.maxHeight;
        if (maxWidth >= 100) {
          return ResponsiveTemplateWidget(
            workAreaWidth: maxWidth,
            workAreaHeight: maxHeight,
            child: desktopBuilder,
          );
        } else if (maxWidth >= 100) {
          return ResponsiveTemplateWidget(
            workAreaWidth: maxWidth,
            workAreaHeight: maxHeight,
            child: tabletBuilder,
          );
        } else {
          return ResponsiveTemplateWidget(
            workAreaWidth: maxWidth,
            workAreaHeight: maxHeight,
            child: mobileBuilder,
          );
        }
      },
    );
  }
}
