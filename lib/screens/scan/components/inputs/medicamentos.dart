import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../constants.dart';

class WidgetMedicamentoInput extends StatefulWidget {
  const WidgetMedicamentoInput({
    Key? key,
  }) : super(key: key);

  @override
  State<WidgetMedicamentoInput> createState() => _WidgetMedicamentoInputState();
}

final listsScan = MedicamentoListScan();

class _WidgetMedicamentoInputState extends State<WidgetMedicamentoInput> {
  TextEditingController medicamentoInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 3),
            child: Text(
              'Faz uso de algum medicamento controlado?',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: labelTextColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: kDefaultPadding * 0.5,
        ),
        PhysicalModel(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          elevation: 1,
          child: TextField(
            enabled: false,
            controller: medicamentoInput,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.medication_rounded,
                color: scannerColor,
              ),
              labelText: 'Quais?',
              labelStyle: TextStyle(
                color: labelTextColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: listsScan.medicamentoListWidget,
        ),
      ],
    );
  }
}

class Medicamento extends StatelessWidget {
  final String yourText;

  const Medicamento({
    Key? key,
    required this.yourText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: scannerColor,
              ),
              child: Row(
                children: [
                  Text(
                    yourText,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.close,
                    color: Color.fromRGBO(15, 15, 15, 1),
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MedicamentoListScan {
  List<Medicamento> medicamentoListWidget = [];
}
