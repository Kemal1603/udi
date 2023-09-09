import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;

  const AppTextFormField({
    Key? key,
    required this.controller,
    this.hintText,
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
          color: const Color.fromRGBO(238, 238, 238, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(10),
                ),
                style: AppFonts.normal13.copyWith(color: colors.black),
              ),
            ),
            if (_showClearButton)
              IconButton(
                onPressed: _clearText,
                icon: Icon(Icons.close, color: colors.black),
              ),
          ],
        ),
      ),
    );
  }
}
