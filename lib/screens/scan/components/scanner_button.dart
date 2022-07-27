import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../../constants.dart';

class BuildScannerButton extends StatefulWidget {
  const BuildScannerButton({Key? key}) : super(key: key);

  @override
  State<BuildScannerButton> createState() => _BuildScannerButtonState();
}

class _BuildScannerButtonState extends State<BuildScannerButton> {
  String resEscaneado = '';

  readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#F26C6C",
      "Cancelar",
      false,
      ScanMode.QR,
    );
    setState(() => resEscaneado = code != '-1' ? code : 'Não Validado');
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
