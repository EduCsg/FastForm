import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../constants.dart';

class WidgetDataInput extends StatelessWidget {
  const WidgetDataInput({
    Key? key,
    required this.dataInput,
  }) : super(key: key);

  final TextEditingController dataInput;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kDefaultPadding * 7.2,
      child: PhysicalModel(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        elevation: 1,
        child: TextField(
          enabled: false,
          controller: dataInput,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.cake_rounded,
              color: scannerColor,
            ), //icon of text field
            labelText: "Nasc.",
            labelStyle: TextStyle(
              color: labelTextColor,
              fontSize: 16,
            ),
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime(2000),
                firstDate: DateTime(1920),
                lastDate: DateTime.now());

            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('dd/MM/yyyy').format(pickedDate);

              dataInput.text = formattedDate;
            } else {
              return;
            }
          },
        ),
      ),
    );
  }
}
