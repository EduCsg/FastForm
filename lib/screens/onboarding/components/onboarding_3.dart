import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildOnboarding3 extends StatelessWidget {
  const BuildOnboarding3({
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
              "assets/images/img3_onboardingpage.svg",
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Como Posso",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Preencher?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
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
                        "Para preencher seu prontuário\nselecione “Quero Preencher”\ne coloque as informações pedidas.\n\nCaso queira escanear, selecione\n“Quero Escanear” na próxima tela!",
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
