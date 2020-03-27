library date_text_input_formatter;

export 'src/format.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/format.dart';

class DateTextInputFormatter extends TextInputFormatter {
  /// Format gives the arrangement of how you want
  /// elements should be arranged
  ///
  /// Example: format: [dd, mm, yyyy] => 12/12/2001
  final List<String> format;

  /// Delimiter is the seperation between elements
  ///
  /// Example: delimiter: "/" => 12/12/2001
  ///
  /// Default is "/"
  final String delimiter;

  DateTextInputFormatter({
    @required this.format,
    this.delimiter = "/",
  })  : assert(format != null && format.isNotEmpty),
        assert(delimiter != null);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // to check that if delimiter is added to the string
    bool _delimiterNotAdded = true;

    final List<int> _format = getformat(format);

    int _sum = 0;
    _format.forEach((f) => _sum += f);

    final int _newTextLength = newValue.text.length;
    int _selectionIndex = newValue.selection.end;
    int _usedSubstringIndex = 0;
    final int _oldTextLength = oldValue.text.length;

    final StringBuffer newText = StringBuffer();

    // Checks that the date is written or not
    if (_newTextLength <= _sum + 2) {
      // Handles 1st delimiter
      int _newTextSum = _format[0];
      if (_newTextLength == _newTextSum && _oldTextLength < _newTextLength) {
        newText.write(
            newValue.text.substring(0, _usedSubstringIndex = _newTextSum) +
                delimiter);
        _delimiterNotAdded = false;
        if (newValue.selection.end >= _format[0])
          _selectionIndex += delimiter.length;
      }

      // Handles 2nd delimiter
      _newTextSum += _format[1] + 1;
      if (_newTextLength == _newTextSum && _oldTextLength < _newTextLength) {
        newText.write(
            newValue.text.substring(0, _usedSubstringIndex = _newTextSum) +
                delimiter);
        _delimiterNotAdded = false;
        if (newValue.selection.end >= _format[1])
          _selectionIndex += delimiter.length;
      }

      // if no delimiter is added
      if (_newTextLength >= _usedSubstringIndex && _delimiterNotAdded) {
        newText.write(newValue.text.substring(_usedSubstringIndex));
      }

      // returns if date is still not completed
      return TextEditingValue(
        text: newText.toString(),
        selection: TextSelection.collapsed(offset: _selectionIndex),
      );
    }

    // returns if date is still not completed
    return TextEditingValue(
      text: oldValue.text,
      selection: TextSelection.collapsed(offset: _selectionIndex - 1),
    );
  }
}
