import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../components/input_formatters.dart';
import '../../../../constants.dart';

class WidgetCpfInput extends StatelessWidget {
  const WidgetCpfInput({
    Key? key,
    required this.cpfInput,
  }) : super(key: key);

  final TextEditingController cpfInput;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
      elevation: 1,
      child: TextField(
        controller: cpfInput,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          CpfInputFormatter(),
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.list_alt_rounded,
            color: iconYellowColor,
          ),
          labelText: 'CPF',
          labelStyle: TextStyle(
            color: labelTextColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
