import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppSwitchButton extends StatefulWidget {
  final bool initValue;
  final Function(bool) onChanged;
  final String? label;

  const AppSwitchButton({
    required this.onChanged,
    required this.initValue,
    this.label,
    super.key,
  });

  @override
  State<AppSwitchButton> createState() => _AppSwitchButtonState();
}

class _AppSwitchButtonState extends State<AppSwitchButton> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: AppDimens.ITEM_SIZE_28,
          height: AppDimens.ITEM_SIZE_20,
          child: FittedBox(
              fit: BoxFit.fill,
              child: Switch(
                value: _value,
                activeColor: AppColors.of(context).white,
                inactiveThumbColor: AppColors.of(context).white,
                inactiveTrackColor: AppColors.of(context).philippineSilver,
                activeTrackColor: AppColors.of(context).alizarin,
                onChanged: (bool value) {
                  setState(() {
                    _value = value;
                  });
                  widget.onChanged(value);
                },
              )),
        ),
        if (widget.label != null) ...<Widget>[
          const SizedBox(
            width: AppDimens.PADDING_10,
          ),
          Text(
            widget.label!,
            style: AppFonts.normal16.copyWith(
              color: AppColors.of(context).matterhorn,
            ),
          ),
        ],
      ],
    );
  }
}
