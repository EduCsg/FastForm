import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../scan/scan_page.dart';

class QueroEscanear extends StatelessWidget {
  const QueroEscanear({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ScanPage(),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          child: SizedBox(
            width: 245,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/quero_escanear.png",
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                const Text(
                  'Quero Escanear!',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: kDefaultPadding * 0.2,
                ),
                const Text(
                  'Função recomendada para\nuso hospitalar.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
