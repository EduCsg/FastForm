import 'package:flutter/material.dart';
import '../../../../constants.dart';

class WidgetNomeInput extends StatelessWidget {
  const WidgetNomeInput({
    Key? key,
    required this.nomeInput,
  }) : super(key: key);

  final TextEditingController nomeInput;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
      elevation: 1,
      child: TextField(
        enabled: false,
        controller: nomeInput,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.person,
            color: scannerColor,
          ),
          labelText: 'Nome Completo',
          labelStyle: TextStyle(
            color: labelTextColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
