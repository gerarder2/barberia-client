import 'package:flutter/services.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Solo permitimos números
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Insertar espacios después de cada grupo de 4 dígitos
    if (newText.length > 4) {
      newText = newText.replaceRange(4, 4, ' ');
    }
    if (newText.length > 9) {
      newText = newText.replaceRange(9, 9, ' ');
    }
    if (newText.length > 14) {
      newText = newText.replaceRange(14, 14, ' ');
    }

    // Limitar a 19 caracteres (formato XXXX XXXX XXXX XXXX)
    if (newText.length > 19) {
      newText = newText.substring(0, 19);
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
