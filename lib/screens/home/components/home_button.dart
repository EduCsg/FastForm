import 'package:barcode_widget/barcode_widget.dart';
import 'package:fast_form/screens/home/components/body.dart';
import 'package:fast_form/screens/home/components/info_corretas.dart';
import 'package:fast_form/screens/home/components/inputs/medicamentos.dart';
import 'package:fast_form/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';

clearInputs(context) {
  inputsControllersList.nomeInput.clear();
  inputsControllersList.maeInput.clear();
  inputsControllersList.paiInput.clear();
  inputsControllersList.dataInput.clear();
  inputsControllersList.telefoneInput.clear();
  inputsControllersList.enderecoInput.clear();
  inputsControllersList.numInput.clear();
  inputsControllersList.cpfInput.clear();
  inputsControllersList.rgInput.clear();

  lists.medicamentoListWidget.clear();

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const HomePage(),
    ),
  );
  Fluttertoast.showToast(msg: "Campos limpos!");
}

SingleChildScrollView buildHomeButton(
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
  bool showFab = MediaQuery.of(context).viewInsets.bottom != 0;

  return SingleChildScrollView(
    child: Visibility(
      visible: !showFab,
      child: SpeedDial(
        spaceBetweenChildren: 15,
        children: [
          SpeedDialChild(
            child: const Icon(
              Icons.done_rounded,
              color: Colors.white,
            ),
            label: "Gerar Prontuário",
            backgroundColor: homeColor,
            onTap: () {
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
                              primary: homeColor,
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
                                        primary: homeColor,
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
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.cleaning_services_rounded,
              color: Colors.white,
            ),
            label: "Limpar",
            backgroundColor: homeColor,
            onTap: () {
              clearInputs(context);
            },
          )
        ],
        backgroundColor: homeColor,
        icon: Icons.menu,
        activeIcon: Icons.close,
      ),
    ),
  );
}
