import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

Widget appButton() => const Center(
      child: SizedBox(
        width: 200,
        height: 50,
        child: AppButton(text: 'Применить'),
      ),
    );

Widget appCheckBox() => const Center(child: AppCheckBox());

Widget appDropDowns() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Text('Classic'),
            ),
            AppDropDownWidget(
              items: const <String>[
                'Item 1',
                'Item 2',
                'Item 3',
                'Item 4',
              ],
              onChanged: (List<String>? item) {},
            ),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Text('With Checkbox'),
            ),
            AppDropDownWidget(
              hasCheckbox: true,
              items: const <String>[
                'Item 1',
                'Item 2',
                'Item 3',
                'Item 4',
              ],
              onChanged: (List<String>? item) {},
            ),
          ],
        ),
      ],
    );

Widget radioButtonGroup() => Center(
      child: RadioButtonGroup(
        items: const [
          'Option 1',
          'Option 2',
          'Option 3',
          // Add more options here if needed.
        ],
        onItemSelected: (selectedItem) {
          print('Selected Item: $selectedItem');
        },
      ),
    );

Widget toggleButtonRow() => Center(
      child: SizedBox(
        height: 50,
        width: 300,
        child: ToggleButtonRow(
            options: const [
              'Option 1',
              'Option 2',
              'Option 3',
            ],
            onOptionChanged: (selectedItem) {
              print('Selected Item: $selectedItem');
            }),
      ),
    );
