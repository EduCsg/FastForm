import 'package:flutter/material.dart';
import '../../../../constants.dart';

class WidgetEnderecoInput extends StatelessWidget {
  const WidgetEnderecoInput({
    Key? key,
    required this.enderecoInput,
  }) : super(key: key);

  final TextEditingController enderecoInput;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PhysicalModel(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        elevation: 1,
        child: TextField(
          controller: enderecoInput,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.other_houses,
              color: scannerColor,
            ),
            labelText: 'Endereço',
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
