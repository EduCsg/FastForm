import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildOnboarding1 extends StatelessWidget {
  const BuildOnboarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/img1_onboardingpage.svg",
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "O que é a Fast Form?",
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
                text: "A ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                ),
                children: [
                  TextSpan(
                    text: 'Fast Form',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text:
                        " é um aplicativo\nque visa a facilitação de\npreenchimento de\nformularios hospitalares.",
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
