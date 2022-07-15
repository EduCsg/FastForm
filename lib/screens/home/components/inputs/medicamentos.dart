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

final lists = MedicamentoListString();

class _WidgetMedicamentoInputState extends State<WidgetMedicamentoInput> {
  TextEditingController medicamentoInput = TextEditingController();
  final List<_Medicamento> _medicamentoListWidget = [];

  void removeServiceCard(index) {
    setState(() {
      _medicamentoListWidget.remove(index);
      lists.medicamentoListString
          .removeAt(lists.medicamentoListString.indexOf(index.yourText));
    });
  }

  void _addMedicamento() {
    setState(() {
      lists.medicamentoListString.add(
        medicamentoInput.text,
      );
      _medicamentoListWidget.add(
        _Medicamento(
          onDelete: removeServiceCard,
          yourText: medicamentoInput.text,
        ),
      );
    });
  }

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
            textInputAction: TextInputAction.send,
            onSubmitted: (value) {
              if (medicamentoInput.text.isNotEmpty) {
                if (lists.medicamentoListString
                    .contains(medicamentoInput.text)) {
                  Fluttertoast.showToast(msg: "Medicamento ja registrado!");
                  medicamentoInput.clear();
                  return;
                } else {
                  _addMedicamento();
                  medicamentoInput.clear();
                }
              }
            },
            controller: medicamentoInput,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.medication_rounded,
                color: iconYellowColor,
              ),
              labelText: 'Quais?',
              labelStyle: TextStyle(
                color: labelTextColor,
                fontSize: 16,
              ),
              suffixIcon: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  if (medicamentoInput.text.isNotEmpty) {
                    if (lists.medicamentoListString
                        .contains(medicamentoInput.text)) {
                      Fluttertoast.showToast(msg: "Medicamento ja registrado!");
                      medicamentoInput.clear();
                      FocusScope.of(context).requestFocus(FocusNode());
                      return;
                    } else {
                      _addMedicamento();
                      medicamentoInput.clear();
                    }
                  }
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                icon: Icon(
                  Icons.add,
                  color: iconYellowColor,
                ),
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
          children: _medicamentoListWidget,
        ),
      ],
    );
  }
}

class _Medicamento extends StatelessWidget {
  final Function(_Medicamento) onDelete;
  final String yourText;

  const _Medicamento({
    Key? key,
    required this.onDelete,
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
                color: const Color.fromRGBO(255, 213, 125, 1),
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
                  IconButton(
                    icon: const Icon(Icons.close),
                    color: const Color.fromRGBO(15, 15, 15, 1),
                    iconSize: 18,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () => onDelete(this),
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

class MedicamentoListString {
  final List<String> medicamentoListString = [];
}
