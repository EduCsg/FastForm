import 'package:flutter/material.dart';
import '../../../../constants.dart';

class WidgetMaeInput extends StatelessWidget {
  const WidgetMaeInput({
    Key? key,
    required this.maeInput,
  }) : super(key: key);

  final TextEditingController maeInput;

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
        controller: maeInput,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.person,
            color: scannerColor,
          ),
          labelText: 'Nome da Mãe',
          labelStyle: TextStyle(
            color: labelTextColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
