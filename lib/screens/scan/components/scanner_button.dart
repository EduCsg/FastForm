import 'package:fast_form_client/screens/scan/components/body_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../../constants.dart';

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
    setState(() => resEscaneadoBruto = code != '-1' ? code : 'Não Validado');

    var arr = resEscaneadoBruto.split('*');
    inputsContollersScan.nomeInput.text = arr[0];
    inputsContollersScan.maeInput.text = arr[1];
    inputsContollersScan.paiInput.text = arr[2];
    inputsContollersScan.dataInput.text = arr[3];
    inputsContollersScan.telefoneInput.text = arr[4];
    inputsContollersScan.enderecoInput.text = arr[5];
    inputsContollersScan.numInput.text = arr[6];
    inputsContollersScan.cpfInput.text = arr[7];
    inputsContollersScan.rgInput.text = arr[8];
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
