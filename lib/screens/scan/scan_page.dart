import 'package:flutter/material.dart';

import 'components/body_scan.dart';
import 'components/app_bar_scan.dart';
import 'components/bottom_scan.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

final inputsContollers = InputsControllers();

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildAppBarScan(),
      body: const BuildBodyScan(),
      bottomNavigationBar: buildBottomScan(
        context,
        size,
        inputsContollers.nomeInput,
        inputsContollers.maeInput,
        inputsContollers.paiInput,
        inputsContollers.dataInput,
        inputsContollers.telefoneInput,
        inputsContollers.enderecoInput,
        inputsContollers.numInput,
        inputsContollers.cpfInput,
        inputsContollers.rgInput,
      ),
    );
  }
}
