import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const AppCheckBox({
    Key? key,
    this.value = false,
    this.onChanged,
  }) : super(key: key);

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
        widget.onChanged?.call(_isChecked);
      },
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_2),
          color: _isChecked ? AppColors.of(context).alizarin10 : AppColors.of(context).white,
          border: Border.all(
            color: _isChecked ? AppColors.of(context).alizarin10 : AppColors.of(context).gray,
            width: 1.5,
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: _isChecked
              ? Center(
                  child: Icon(
                    Icons.check,
                    size: 14,
                    color: AppColors.of(context).white,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
