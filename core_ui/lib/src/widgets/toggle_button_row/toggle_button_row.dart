import 'package:flutter/material.dart';

import 'expanded_button.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          for (int i = 0; i < widget.options.length; i++)
            ExpandedButton(
              index: i,
              isSelected: _selectedIndex == i,
              onTap: _handleButtonTap,
              buttonText: widget.options[i],
            ),
        ],
      ),
    );
  }
}
