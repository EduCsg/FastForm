import 'package:flutter/services.dart';

abstract class CompoundableFormatter extends TextInputFormatter {
  int get maxLength;
}

class CpfInputFormatter extends TextInputFormatter
    implements CompoundableFormatter {
  @override
  int get maxLength => 11;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueLength = newValue.text.length;
    var selectionIndex = newValue.selection.end;

    if (newValueLength > maxLength) {
      return oldValue;
    }

    var substrIndex = 0;
    final newText = StringBuffer();

    if (newValueLength >= 4) {
      newText.write('${newValue.text.substring(0, substrIndex = 3)}.');
      if (newValue.selection.end >= 3) selectionIndex++;
    }
    if (newValueLength >= 7) {
      newText.write('${newValue.text.substring(3, substrIndex = 6)}.');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    if (newValueLength >= 10) {
      newText.write('${newValue.text.substring(6, substrIndex = 9)}-');
      if (newValue.selection.end >= 9) selectionIndex++;
    }
    if (newValueLength >= substrIndex) {
      newText.write(newValue.text.substring(substrIndex));
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

class TelefoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueLength = newValue.text.length;
    var selectionIndex = newValue.selection.end;
    var substrIndex = 0;
    final newText = StringBuffer();

    if (newValueLength == 12) {
      if (newValue.text.toString()[2] != '9') {
        return oldValue;
      }
    }

    if (newValueLength > 11) {
      return oldValue;
    }
    if (newValueLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }

    if (newValueLength >= 3) {
      newText.write('${newValue.text.substring(0, substrIndex = 2)}) ');
      if (newValue.selection.end >= 2) selectionIndex += 2;
    }

    if (newValue.text.length == 11) {
      if (newValueLength >= 8) {
        newText.write('${newValue.text.substring(2, substrIndex = 7)}-');
        if (newValue.selection.end >= 7) selectionIndex++;
      }
    } else {
      if (newValueLength >= 7) {
        newText.write('${newValue.text.substring(2, substrIndex = 6)}-');
        if (newValue.selection.end >= 6) selectionIndex++;
      }
    }

    if (newValueLength >= substrIndex) {
      newText.write(newValue.text.substring(substrIndex));
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

class RgInputFormatter extends TextInputFormatter {
  int get maxLength => 11;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueLength = newValue.text.length;
    var selectionIndex = newValue.selection.end;

    if (newValueLength > maxLength) {
      return oldValue;
    }

    var substrIndex = 0;
    final newText = StringBuffer();

    if (newValueLength >= 3) {
      newText.write('${newValue.text.substring(0, substrIndex = 2)}.');
      if (newValue.selection.end >= 2) selectionIndex++;
    }
    if (newValueLength >= 6) {
      newText.write('${newValue.text.substring(2, substrIndex = 5)}.');
      if (newValue.selection.end >= 5) selectionIndex++;
    }
    if (newValueLength >= 9) {
      newText.write('${newValue.text.substring(5, substrIndex = 8)}-');
      if (newValue.selection.end >= 8) selectionIndex++;
    }

    if (newValueLength >= substrIndex) {
      newText.write(newValue.text.substring(substrIndex));
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
