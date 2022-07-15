import 'package:barcode_widget/barcode_widget.dart';
import 'package:fast_form_client/screens/home/components/imports.dart';
import 'package:flutter/material.dart';

import '../../../components/model/json_data.dart';
import '../../../constants.dart';

SizedBox buildBottomScan(
  BuildContext context,
  Size size,
  TextEditingController nomeInput,
  TextEditingController maeInput,
  TextEditingController paiInput,
  TextEditingController dataInput,
  TextEditingController telefoneInput,
  TextEditingController enderecoInput,
  TextEditingController numInput,
  TextEditingController cpfInput,
  TextEditingController rgInput,
) {
  return SizedBox(
    height: kDefaultPadding * 5,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text(
                    'As informações estão corretas?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  content: BarcodeWidget(
                    barcode: Barcode.qrCode(),
                    data:
                        'Informações: ${jsonData.toJson()}, medicamentos: ${lists.medicamentoListString.toString()}',
                    width: 225,
                    height: 225,
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(91, 217, 189, 1),
                      ),
                      child: const Text(
                        'Fechar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                barrierDismissible: false,
              );
            },
            style: ElevatedButton.styleFrom(
              primary: const Color.fromRGBO(91, 217, 189, 1),
              fixedSize: Size(
                size.width - 60,
                35,
              ),
            ),
            child: const Text('Gerar QrCode'),
          ),
          const SizedBox(
            height: kDefaultPadding * 0.25,
          ),
          Text(
            'Você pode alterar as informações a qualquer momento',
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w300,
              fontSize: 10,
            ),
          )
        ],
      ),
    ),
  );
}
