import 'package:fast_form_client/constants.dart';
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
    return Scaffold(
      appBar: buildAppBarScan(),
      body: const BuildBodyScan(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: scannerColor,
        child: const Icon(
          Icons.qr_code,
        ),
      ),
      bottomNavigationBar: const BuildBottomScan(),
    );
  }
}
