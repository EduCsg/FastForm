import 'package:flutter/material.dart';

import '../../../constants.dart';

class BuildBottomHome extends StatelessWidget {
  const BuildBottomHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        'As informações não possuem conexão\ncom banco de dados.',
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
