import 'package:flutter/material.dart';

import 'components/body_scan.dart';
import 'components/app_bar_scan.dart';
import 'components/bottom_scan.dart';
import 'components/scanner_button.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarScan(context),
      body: const BuildBodyScan(),
      floatingActionButton: const BuildScannerButton(),
      bottomNavigationBar: const BuildBottomScan(),
    );
  }
}
