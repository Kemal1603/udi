import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class ToggleGroupWidget extends StatelessWidget {
  final String title;
  final List<String> options;
  const ToggleGroupWidget({
    super.key,
    required this.title,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: AppFonts.bold18),
        const SizedBox(height: AppDimens.PADDING_10),
        ToggleButtonRow(
          onOptionChanged: (String selectedItem) {},
          options: options,
        ),
      ],
    );
  }
}