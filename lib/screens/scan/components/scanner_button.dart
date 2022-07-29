import 'package:fast_form_client/screens/home/home_page.dart';
import 'package:fast_form_client/screens/scan/components/body_scan.dart';
import 'package:fast_form_client/screens/scan/scan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';
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

    void updateData() {
      setState(() => resEscaneadoBruto = code);

      var resDividido = resEscaneadoBruto.split('*');

      listsScan.medicamentoListWidget.add(
        Medicamento(
          yourText: resDividido.last,
        ),
      );

      var i = 0;
      inputsContollersScan.nomeInput.text = resDividido[i++];
      inputsContollersScan.maeInput.text = resDividido[i++];
      inputsContollersScan.paiInput.text = resDividido[i++];
      inputsContollersScan.dataInput.text = resDividido[i++];
      inputsContollersScan.telefoneInput.text = resDividido[i++];
      inputsContollersScan.enderecoInput.text = resDividido[i++];
      inputsContollersScan.numInput.text = resDividido[i++];
      inputsContollersScan.cpfInput.text = resDividido[i++];
      inputsContollersScan.rgInput.text = resDividido[i++];
    }

    if (code == '-1') {
      Fluttertoast.showToast(msg: "Código não válido!");
      return;
    } else {
      updateData();
    }

    if (!mounted) return;
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ScanPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: readQRCode,
      backgroundColor: scannerColor,
      child: const Icon(
        Icons.qr_code,
      ),
    );
  }
}
