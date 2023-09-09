import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppCheckBoxGroup extends StatefulWidget {
  final String title;
  final List<String> options;
  final Function(List<String>) onChanged;

  const AppCheckBoxGroup({
    required this.title,
    required this.options,
    required this.onChanged,
  });

  @override
  _AppCheckBoxGroupState createState() => _AppCheckBoxGroupState();
}

class _AppCheckBoxGroupState extends State<AppCheckBoxGroup> {
  late List<bool> _isCheckedList;

  @override
  void initState() {
    super.initState();

    _isCheckedList = List<bool>.generate(widget.options.length, (int index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.title,
          style: AppFonts.bold18,
        ),
        const SizedBox(height: AppDimens.PADDING_10),
        Column(
          children: List<Widget>.generate(
            widget.options.length,
            (int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: AppDimens.PADDING_10),
                child: Row(
                  children: <Widget>[
                    AppCheckBox(
                      value: _isCheckedList[index],
                      onChanged: (bool value) {
                        setState(
                          () {
                            _isCheckedList[index] = value;
                            widget.onChanged(_getSelectedOptions());
                          },
                        );
                      },
                    ),
                    const SizedBox(width: AppDimens.PADDING_8),
                    Text(
                      widget.options[index],
                      style: AppFonts.normal16,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  List<String> _getSelectedOptions() {
    final List<String> selectedOptions = [];
    for (int i = 0; i < widget.options.length; i++) {
      if (_isCheckedList[i]) {
        selectedOptions.add(widget.options[i]);
      }
    }
    return selectedOptions;
  }
}
