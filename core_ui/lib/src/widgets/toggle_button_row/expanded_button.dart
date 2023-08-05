import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {
  final int index;
  final bool isSelected;
  final Function(int) onTap;
  final String buttonText;

  const ExpandedButton({
    super.key,
    required this.index,
    required this.isSelected,
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
