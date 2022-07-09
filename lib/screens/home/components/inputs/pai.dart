import 'package:flutter/material.dart';
import '../../../../constants.dart';

class WidgetPaiInput extends StatelessWidget {
  const WidgetPaiInput({
    Key? key,
    required this.paiInput,
  }) : super(key: key);

  final TextEditingController paiInput;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
      elevation: 1,
      child: TextField(
        controller: paiInput,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.person,
            color: iconYellowColor,
          ),
          label: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Nome do Pai ',
                  style: TextStyle(color: labelTextColor, fontSize: 16),
                ),
                TextSpan(
                  text: '(opcional)',
                  style: TextStyle(color: labelTextColor, fontSize: 10),
                ),
              ],
            ),
          ),
          labelStyle: TextStyle(
            color: labelTextColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
