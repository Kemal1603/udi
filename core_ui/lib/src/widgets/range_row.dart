import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core_ui.dart';

class RangeRow extends StatefulWidget {
  final String? initialFrom;
  final String? initialTo;
  final String title;
  final Function(String)? onFromChanged;
  final Function(String)? onToChanged;

  const RangeRow({
    super.key,
    required this.title,
    this.initialFrom,
    this.initialTo,
    this.onFromChanged,
    this.onToChanged,
  });

  @override
  State<RangeRow> createState() => _RangeRowState();
}

class _RangeRowState extends State<RangeRow> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fromController.text = widget.initialFrom ?? '';
    _toController.text = widget.initialTo ?? '';
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.title,
          style: AppFonts.bold18.copyWith(color: AppColors.of(context).textColor),
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            AppTextFormField(
              controller: _fromController,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              onChanged: widget.onFromChanged,
              hintText: 'common.from'.tr(),
            ),
            const SizedBox(width: 25),
            AppTextFormField(
              controller: _toController,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              onChanged: widget.onToChanged,
              hintText: 'common.to'.tr(),
            ),
          ],
        ),
      ],
    );
  }
}
