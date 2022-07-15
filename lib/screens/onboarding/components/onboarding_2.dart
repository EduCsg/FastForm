import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildOnboarding2 extends StatelessWidget {
  const BuildOnboarding2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/img2_onboardingpage.svg",
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Como Funciona?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(fontSize: 18, color: Colors.black),
                children: [
                  TextSpan(
                    text:
                        "Basta preencher o prontuário,\nna próxima vez que você for\nao hospital apenas apresente o\nQrCode e pronto!\n\nSeu prontuário será enviado!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
