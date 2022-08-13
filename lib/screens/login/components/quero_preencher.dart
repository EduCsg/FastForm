import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../../constants.dart';
import '../../home/home_page.dart';

class QueroPreencher extends StatelessWidget {
  const QueroPreencher({
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
          child: const HomePage(),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/images/quero_preencher.svg",
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            const Text(
              'Quero Preencher!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: kDefaultPadding * 0.2,
            ),
            const Text(
              'Escolha caso queira preencher\nseu prontuário.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
