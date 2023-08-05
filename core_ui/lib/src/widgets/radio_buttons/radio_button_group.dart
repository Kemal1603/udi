import 'package:flutter/material.dart';

class RadioButtonGroup extends StatefulWidget {
  final List<String> items;
  final Function(String) onItemSelected;

  const RadioButtonGroup({
    super.key,
    required this.items,
    required this.onItemSelected,
  });

  @override
  _RadioButtonGroupState createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (String item in widget.items)
          Row(
            children: [
              Radio<String>(
                value: item,
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                    widget.onItemSelected(value!);
                  });
                },
              ),
              Text(item),
            ],
          ),
      ],
    );
  }
}
