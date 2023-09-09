import 'package:flutter/material.dart';

import '../../core_ui.dart';

class RangeRow extends StatelessWidget {
  final String title;

  const RangeRow({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: AppFonts.bold18.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            AppTextFormField(
              controller: TextEditingController(),
              hintText: 'От',
            ),
            const SizedBox(width: 25),
            AppTextFormField(
              controller: TextEditingController(),
              hintText: 'До',
            ),
          ],
        ),
      ],
    );
  }
}
