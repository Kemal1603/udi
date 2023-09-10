import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core_ui.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextFormField({
    required this.controller,
    this.onChanged,
    this.hintText,
    this.inputFormatters,
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool _showClearButton;

  @override
  void initState() {
    super.initState();
    _showClearButton = widget.controller.text.isNotEmpty;
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _showClearButton = widget.controller.text.isNotEmpty;
    });
    widget.onChanged?.call(widget.controller.text);
  }

  void _clearText() {
    setState(() {
      widget.controller.clear();
      _showClearButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);

    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: colors.whiteNeutral,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                inputFormatters: widget.inputFormatters,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(10),
                ),
                style: AppFonts.normal13.copyWith(color: colors.textColor),
              ),
            ),
            if (_showClearButton)
              IconButton(
                onPressed: _clearText,
                icon: Icon(Icons.close, color: colors.iconsColor),
              ),
          ],
        ),
      ),
    );
  }
}
