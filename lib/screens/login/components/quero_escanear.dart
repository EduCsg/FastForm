import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../constants.dart';
import '../../scan/scan_page.dart';

class QueroEscanear extends StatelessWidget {
  const QueroEscanear({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeftWithFade,
          duration: const Duration(milliseconds: 400),
          child: const ScanPage(),
        ),
      ),
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
