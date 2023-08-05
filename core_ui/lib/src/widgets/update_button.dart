import 'dart:async';

import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class UpdateButton extends StatefulWidget {
  final Function()? onRefresh;
  final DateTime? lastUpdated;

  const UpdateButton({
    this.lastUpdated,
    this.onRefresh,
    super.key,
  });

  @override
  State<UpdateButton> createState() => _UpdateButtonState();
}

class _UpdateButtonState extends State<UpdateButton> {
  String lastUpdated = '';
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    countdownTimer = Timer.periodic(Duration(minutes: 1), (_) => setCountDown());
  }

  void setCountDown() {
    setState(() {});
  }

  @override
  void dispose() {
    countdownTimer!.cancel();
    countdownTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: AppDimens.PADDING_10),
      decoration: BoxDecoration(
        color: AppColors.of(context).alizarin10,
        borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_4),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: AppDimens.ITEM_SIZE_10),
          const Text(
            'update.lastUpdated',
          ),
          AppIconButton(
            icon: AppImages.refresh,
            onTap: () {
              widget.onRefresh?.call();
            },
          ),
        ],
      ),
    );
  }
}
