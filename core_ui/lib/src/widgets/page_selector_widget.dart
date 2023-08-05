import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class PageSelectorWidget extends StatelessWidget {
  final Function() onPrevPage;
  final Function() onNextPage;
  final int currentPage;
  final bool isLastPage;

  const PageSelectorWidget({
    required this.onPrevPage,
    required this.onNextPage,
    required this.currentPage,
    required this.isLastPage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppIconButton(
            icon: AppImages.arrowBack,
            iconColor: currentPage == 1 ? colors.matterhorn.withOpacity(0.5) : colors.matterhorn,
            onTap: currentPage == 1 ? () {} : onPrevPage,
          ),
          SizedBox(width: AppDimens.ITEM_SIZE_10),
          Text(
            currentPage.toString(),
            style: AppFonts.normal16.copyWith(
              color: colors.matterhorn,
            ),
          ),
          SizedBox(width: AppDimens.ITEM_SIZE_10),
          AppIconButton(
            icon: AppImages.arrow,
            iconColor: isLastPage ? colors.matterhorn.withOpacity(0.5) : colors.matterhorn,
            onTap: isLastPage ? () {} : onNextPage,
          ),
        ],
      ),
    );
  }
}
