import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class NavigationHeaderWidget extends StatelessWidget {
  NavigationHeaderWidget({Key? key}) : super(key: key);

  String _getRouteName(String routeName) {
    return '';
  }

  String _getParentRouteName(BuildContext context) {
    return '';
  }

  final Function _onTap = () {};

  List<Widget> _buildNavigation(BuildContext context) {
    final List<Widget> widgets = <Widget>[];
    widgets.add(
      InkWell(
        onTap: () {
          _onTap();
        },
        child: Text(
          _getRouteName(_getParentRouteName(context)),
          style: AppFonts.normal24.copyWith(
            color: AppColors.of(context).alizarin,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
    widgets.add(SizedBox(width: AppDimens.ITEM_SIZE_10));
    widgets.add(AppImage(image: AppImages.arrow));
    widgets.add(SizedBox(width: AppDimens.ITEM_SIZE_10));
    widgets.add(
      Text(
        ' _getRouteName(context.router.current.name)',
        style: AppFonts.normal24.copyWith(
          color: AppColors.of(context).matterhorn,
        ),
      ),
    );

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimens.PADDING_20),
      child: Row(
        children: _buildNavigation(context),
      ),
    );
  }
}
