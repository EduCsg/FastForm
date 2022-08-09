import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';
import '../components/body_scan.dart';
import 'imports.dart';

class BuildScannerButton extends StatefulWidget {
  const BuildScannerButton({Key? key}) : super(key: key);

  @override
  State<BuildScannerButton> createState() => BuildScannerButtonState();
}

class BuildScannerButtonState extends State<BuildScannerButton> {
  String resEscaneadoBruto = '';

  readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#F26C6C",
      "Cancelar",
      false,
      ScanMode.QR,
    );

    setState(() => resEscaneadoBruto = code);

    var resDividido = resEscaneadoBruto.split('*');

    var medicamentosArr =
        resDividido.last.replaceAll('[', '').replaceAll(']', '').split(',');

    void updateData() {
      var i = 1;
      inputsContollersScan.nomeInput.text = resDividido[i++];
      inputsContollersScan.maeInput.text = resDividido[i++];
      inputsContollersScan.paiInput.text = resDividido[i++];
      inputsContollersScan.dataInput.text = resDividido[i++];
      inputsContollersScan.telefoneInput.text = resDividido[i++];
      inputsContollersScan.enderecoInput.text = resDividido[i++];
      inputsContollersScan.numInput.text = resDividido[i++];
      inputsContollersScan.cpfInput.text = resDividido[i++];
      inputsContollersScan.rgInput.text = resDividido[i++];

      for (var i = 0; i < medicamentosArr.length; i++) {
        listsScan.medicamentoListWidget.add(
          Medicamento(
            yourText: medicamentosArr[i],
          ),
        );
      }
    }

    if (code == '-1' || resDividido.first != 'fastformcode') {
      Fluttertoast.showToast(msg: "Código não válido!");
    } else {
      updateData();
    }
  }

  clearInputs() {
    inputsContollersScan.nomeInput.clear();
    inputsContollersScan.maeInput.clear();
    inputsContollersScan.paiInput.clear();
    inputsContollersScan.dataInput.clear();
    inputsContollersScan.telefoneInput.clear();
    inputsContollersScan.enderecoInput.clear();
    inputsContollersScan.numInput.clear();
    inputsContollersScan.cpfInput.clear();
    inputsContollersScan.rgInput.clear();

    listsScan.medicamentoListWidget.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SpeedDial(
        spaceBetweenChildren: 15,
        children: [
          SpeedDialChild(
            child: const Icon(
              Icons.qr_code,
              color: Colors.white,
            ),
            label: "Escanear",
            backgroundColor: scannerColor,
            onTap: () {
              if (inputsContollersScan.nomeInput.text != '') {
                Fluttertoast.showToast(
                    msg: "Limpe os campos antes de escanear!");
              } else {
                readQRCode();
              }
            },
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.cleaning_services_rounded,
              color: Colors.white,
            ),
            label: "Limpar",
            backgroundColor: scannerColor,
            onTap: () {
              clearInputs();

              // Navigator.of(context).pop();
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const ScanPage(),
              //   ),
              // );
            },
          )
        ],
        backgroundColor: scannerColor,
        icon: Icons.menu,
        activeIcon: Icons.close,
      ),
    );
  }
}
