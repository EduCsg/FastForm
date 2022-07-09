import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../constants.dart';

class WidgetNumInput extends StatelessWidget {
  const WidgetNumInput({
    Key? key,
    required this.numInput,
  }) : super(key: key);

  final TextEditingController numInput;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.0,
      child: PhysicalModel(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        elevation: 1,
        child: TextField(
          controller: numInput,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(4),
          ],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
            border: InputBorder.none,
            labelText: 'Nº',
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
