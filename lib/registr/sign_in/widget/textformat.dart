import 'package:flutter/services.dart';

class MaskedTextInputFormatter extends TextInputFormatter {
  final List<String> patterns = [
    '+XXX-XX-XXX-XX-XX',
    '+XX-X-XXXX-XXXX',
  ];

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String value = newValue.text;
    String pattern = '';

    if (value.startsWith('9')) {
      pattern = patterns[0];
    } else if (value.startsWith('8')) {
      pattern = patterns[1];
    } else {
      pattern = patterns[0]; // Default pattern
    }

    String maskedText = '';

    var valueIndex = 0;
    for (var patternIndex = 0; patternIndex < pattern.length; patternIndex++) {
      if (pattern[patternIndex] == 'X') {
        if (valueIndex < value.length) {
          maskedText += value[valueIndex];
          valueIndex++;
        }
      } else {
        maskedText += pattern[patternIndex];
      }

      if (valueIndex >= value.length) {
        break;
      }
    }

    return TextEditingValue(
      text: maskedText,
      selection: TextSelection.collapsed(offset: maskedText.length),
    );
  }
}
