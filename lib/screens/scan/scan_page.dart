import 'package:flutter/material.dart';

import 'components/body_scan.dart';
import 'components/app_bar_scan.dart';
import 'components/bottom_scan.dart';
import 'components/scanner_button.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
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
