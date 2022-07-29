import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../components/input_formatters.dart';
import '../../../../constants.dart';

class WidgetRgInput extends StatelessWidget {
  const WidgetRgInput({
    Key? key,
    required this.rgInput,
  }) : super(key: key);

  final TextEditingController rgInput;

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
        controller: rgInput,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          RgInputFormatter(),
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.list_alt_rounded,
            color: scannerColor,
          ),
          labelText: 'RG',
          labelStyle: TextStyle(
            color: labelTextColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
