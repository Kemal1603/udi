import 'package:flutter/services.dart';

enum DateFormatterType { date, time }

class DateFormatter extends TextInputFormatter {
  final String mask;
  final String separator;
  final DateFormatterType type;

  DateFormatter({
    this.type = DateFormatterType.date,
    this.mask = 'xx/xx/xxxx',
    this.separator = '/',
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        final String lastEnteredChar =
            newValue.text.substring(newValue.text.length - 1);
        if (!_isNumeric(lastEnteredChar)) {
          return oldValue;
        }

        if (newValue.text.length > mask.length) {
          return oldValue;
        }
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          final String value = _validateValue(oldValue.text);

          return TextEditingValue(
            text: '$value$separator$lastEnteredChar',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }

        if (newValue.text.length == mask.length) {
          return TextEditingValue(
            text: _validateValue(newValue.text),
            selection: TextSelection.collapsed(
              offset: newValue.selection.end,
            ),
          );
        }
      }
    }
    return newValue;
  }

  bool _isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String _formatNumber(int number) {
    if (number < 10) {
      return '0$number';
    }
    return number.toString();
  }

  String _validateValue(String s) {
    String result = s;

    if (type == DateFormatterType.time) {
      if (s.length < 3) {
        // hours
        final int num = int.parse(s.substring(s.length - 2));
        final String raw = s.substring(0, s.length - 2);
        if (num == 0) {
          result = '${raw}00';
        } else if (num > 23) {
          result = '${raw}23';
        } else {
          result = s;
        }
      } else if (s.length < 6) {
        // minutes
        final int num = int.parse(s.substring(s.length - 2));
        final String raw = s.substring(0, s.length - 2);
        if (num == 0) {
          result = '${raw}01';
        } else if (num > 59) {
          result = '${raw}59';
        } else {
          result = s;
        }
      }
      return result;
    }

    if (s.length == mask.length) {
      final List<String> components = s.split(separator);
      if (components.length == 3) {
        int? day = int.tryParse(components[0]);
        int? month = int.tryParse(components[1]);
        int? year = int.tryParse(components[2]);
        if (day != null && month != null && year != null) {
          if (day == 0) {
            day = 1;
          } else if (day > 31) {
            day = 31;
          }
          if (month == 0) {
            month = 1;
          } else if (month > 12) {
            month = 12;
          }
          if (year < 1950) {
            year = 1950;
          } else if (year > DateTime.now().year) {
            year = DateTime.now().year;
          }
          result =
              '${_formatNumber(day)}$separator${_formatNumber(month)}$separator${_formatNumber(year)}';
        }
        return result;
      }
    }

    if (s.length < 4) {
      // days
      final int num = int.parse(s.substring(s.length - 2));
      final String raw = s.substring(0, s.length - 2);
      if (num == 0) {
        result = '${raw}01';
      } else if (num > 31) {
        result = '${raw}31';
      } else {
        result = s;
      }
    } else if (s.length < 7) {
      // month
      final int num = int.parse(s.substring(s.length - 2));
      final String raw = s.substring(0, s.length - 2);
      if (num == 0) {
        result = '${raw}01';
      } else if (num > 12) {
        result = '${raw}12';
      } else {
        result = s;
      }
    } else {
      // year
      final int num = int.parse(s.substring(s.length - 4));
      final String raw = s.substring(0, s.length - 4);
      if (num < 1950) {
        result = '${raw}1950';
      } else if (num > DateTime.now().year) {
        result = '${raw}2006';
      } else {
        result = s;
      }
    }

    return result;
  }
}
