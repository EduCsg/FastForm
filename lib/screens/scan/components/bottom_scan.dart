import 'package:flutter/material.dart';

import '../../../constants.dart';

class BuildBottomScan extends StatelessWidget {
  const BuildBottomScan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        'As informações escaneadas podem ser editadas apenas\npela via do cliente.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w300,
          fontSize: 10,
        ),
      ),
    );
  }
}
