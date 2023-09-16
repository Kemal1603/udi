import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class ToggleButtonRow extends StatefulWidget {
  final List<String> options;
  final Function(String) onOptionChanged;

  const ToggleButtonRow({
    super.key,
    required this.options,
    required this.onOptionChanged,
  });

  @override
  _ToggleButtonRowState createState() => _ToggleButtonRowState();
}

class _ToggleButtonRowState extends State<ToggleButtonRow> {
  int _selectedIndex = 0;

  void _handleButtonTap(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onOptionChanged(widget.options[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors.of(context);
    return Wrap(
      spacing: 13,
      children: <Widget>[
        for (int i = 0; i < widget.options.length; i++)
          GestureDetector(
            onTap: () => _handleButtonTap(i),
            child: Chip(
              label: Text(
                widget.options[i],
                style: AppFonts.normal13.copyWith(
                  color: _selectedIndex == i ? appColors.white : appColors.black,
                ),
              ),
              labelStyle: const TextStyle(fontSize: 12),
              backgroundColor:
                  _selectedIndex == i ? appColors.brandeisBlue : appColors.gainsboroLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_10),
              ),
            ),
          ),
      ],
    );
  }
}
