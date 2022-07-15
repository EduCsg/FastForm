import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../components/input_formatters.dart';
import '../../../../constants.dart';

class WidgetTelefoneInput extends StatelessWidget {
  const WidgetTelefoneInput({
    Key? key,
    required this.telefoneInput,
  }) : super(key: key);

  final TextEditingController telefoneInput;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PhysicalModel(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        elevation: 1,
        child: TextFormField(
          controller: telefoneInput,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            TelefoneInputFormatter(),
          ],
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(6, 8, 6, 8),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.call,
              color: iconYellowColor,
            ),
            labelText: 'Telefone',
            labelStyle: TextStyle(
              color: labelTextColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
