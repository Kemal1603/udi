import 'package:flutter/material.dart';

class RadioButtonGroup extends StatefulWidget {
  final List<String> items;
  final Function(String) onItemSelected;
  final String? initialSelectedValue;

  const RadioButtonGroup({
    Key? key,
    required this.items,
    required this.onItemSelected,
    this.initialSelectedValue,
  }) : super(key: key);

  @override
  _RadioButtonGroupState createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialSelectedValue ?? widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (String item in widget.items)
          Row(
            children: <Widget>[
              Radio<String>(
                value: item,
                groupValue: selectedValue,
                onChanged: (String? value) {
                  setState(
                    () {
                      selectedValue = value;
                      widget.onItemSelected(value!);
                    },
                  );
                },
              ),
              Text(item),
            ],
          ),
      ],
    );
  }
}
