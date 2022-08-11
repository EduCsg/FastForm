import 'package:barcode_widget/barcode_widget.dart';
import 'package:fast_form_client/screens/home/components/imports.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'imports.dart';

import '../../../constants.dart';
import 'info_corretas.dart';

SizedBox buildBottom(
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
              FocusManager.instance.primaryFocus?.unfocus();
              if (nomeInput.text.split(' ').length < 2 ||
                  maeInput.text.split(' ').length < 2 ||
                  dataInput.text.isEmpty ||
                  telefoneInput.text.length < 14 ||
                  enderecoInput.text.isEmpty ||
                  numInput.text.isEmpty ||
                  cpfInput.text.length != 14 ||
                  rgInput.text.length < 12) {
                Fluttertoast.showToast(
                    msg: 'Preencha todas informações\nantes de continuar!');
              } else {
                showDialog(
                  context: context,
                  builder: (_) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AlertDialog(
                        title: const Text(
                          'As informações estão corretas?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        content: informacoesCorretas(
                            nomeInput,
                            maeInput,
                            paiInput,
                            dataInput,
                            telefoneInput,
                            enderecoInput,
                            numInput,
                            cpfInput,
                            rgInput),
                        actions: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0.0,
                              shadowColor: Colors.transparent,
                            ),
                            child: Text(
                              'Voltar',
                              style: TextStyle(
                                color: labelTextColor,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(91, 217, 189, 1),
                            ),
                            child: const Text(
                              'Sim!',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text(
                                    'Seu QR Code',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  content: BarcodeWidget(
                                    barcode: Barcode.qrCode(),
                                    data:
                                        "fastformcode*${nomeInput.text}*${maeInput.text}*${paiInput.text}*${dataInput.text}*${telefoneInput.text}*${enderecoInput.text}*${numInput.text}*${cpfInput.text}*${rgInput.text}*${lists.medicamentoListString.toString()}",
                                    width: 250,
                                    height: 250,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color.fromRGBO(
                                            91, 217, 189, 1),
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
                          ),
                        ],
                      ),
                    ],
                  ),
                  barrierDismissible: false,
                );
              }
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
