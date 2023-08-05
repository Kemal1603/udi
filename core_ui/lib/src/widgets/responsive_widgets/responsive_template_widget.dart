import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class ResponsiveTemplateWidget extends StatelessWidget {
  final Widget child;
  final double workAreaWidth;
  final double workAreaHeight;

  ResponsiveTemplateWidget({
    required this.child,
    required this.workAreaWidth,
    required this.workAreaHeight,
    Key? key,
  }) : super(key: key);

  final ScrollController _horizontal = ScrollController();
  final ScrollController _vertical = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scrollbar(
          controller: _horizontal,
          thumbVisibility: true,
          trackVisibility: true,
          child: SingleChildScrollView(
            controller: _horizontal,
            scrollDirection: Axis.horizontal,
            child: Scrollbar(
              controller: _vertical,
              thumbVisibility: true,
              trackVisibility: true,
              child: SingleChildScrollView(
                controller: _vertical,
                scrollDirection: Axis.vertical,
                child: Container(
                  height: workAreaHeight,
                  width: workAreaWidth,
                  padding: EdgeInsets.only(left: AppDimens.PADDING_70),
                  color: AppColors.of(context).white,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
