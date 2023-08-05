import 'package:flutter/material.dart';

class MoneyMaskedTextController extends TextEditingController {
  MoneyMaskedTextController({
    double initialValue = 0.0,
  }) {
    addListener(() {
      updateValue(numberValue);
      afterChange(text, numberValue);
    });

    updateValue(initialValue);
  }

  Function afterChange = (String maskedValue, double rawValue) {};

  double _lastValue = 0.0;

  void updateValue(double value) {
    double valueToUse = value;

    if (value.toStringAsFixed(0).length > 7) {
      valueToUse = _lastValue;
    } else {
      _lastValue = value;
    }

    final String masked = _applyMask(valueToUse);

    if (masked != text) {
      text = masked;
      selection = TextSelection.fromPosition(TextPosition(offset: super.text.length));
    }
  }

  double get numberValue {
    String value = text;
    if (value.isEmpty) {
      value = '0.00';
    }
    final List<String> parts = _getOnlyNumbers(value).split('').toList(growable: true);

    parts.insert(parts.length - 2, '.');

    return double.parse(parts.join());
  }

  String _getOnlyNumbers(String text) {
    String cleanedText = text;

    final RegExp onlyNumbersRegex = RegExp(r'\D');

    cleanedText = cleanedText.replaceAll(onlyNumbersRegex, '');

    return cleanedText;
  }

  String _applyMask(double value) {
    return '';
  }
}
