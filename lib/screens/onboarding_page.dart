import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/svg.dart';

import './home_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;
  bool isFirstPage = true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
              setState(() => isFirstPage = index == 0);
            },
            children: [
              //pagina 1
              Container(
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
              ),
              //pagina 2
              Container(
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
                                  " Após preencher o prontuário,\nna próxima vez que você for\nao hospital, basta aproximar o\naplicativo do leitor e pronto.\nO seu prontuário foi enviado!",
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
              ),
              //pagina 3
              Container(
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
                                  "Como esta é sua primeira vez,\nbasta clicar no botão\nabaixo.\n\nApós preencher seus dados,\nclique no botão\npara gerar o QR Code!",
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
              ),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? Container(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                  top: 0,
                  bottom: 20,
                ),
                height: 120,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: const ColorTransitionEffect(
                          spacing: 16,
                          dotHeight: 8,
                          dotWidth: 8,
                          dotColor: Color.fromRGBO(49, 49, 49, 0.4),
                          activeDotColor: Color.fromRGBO(49, 49, 49, 1),
                        ),
                        onDotClicked: (index) => controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 1000,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(92, 218, 189, 1),
                        ),
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool('showHome', true);

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Vamos Preencher!",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 0),
                height: 120,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isFirstPage
                        ? const SizedBox(width: 45)
                        : SizedBox(
                            width: 45,
                            child: FloatingActionButton(
                              onPressed: () => controller.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 224, 231, 227),
                              child: const Icon(
                                Icons.arrow_back_ios_rounded,
                                size: 18,
                                color: Color.fromARGB(255, 92, 218, 189),
                              ),
                            ),
                          ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: const ColorTransitionEffect(
                          spacing: 16,
                          dotHeight: 8,
                          dotWidth: 8,
                          dotColor: Color.fromRGBO(49, 49, 49, 0.4),
                          activeDotColor: Color.fromRGBO(49, 49, 49, 1),
                        ),
                        onDotClicked: (index) => controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 45,
                      child: FloatingActionButton(
                        backgroundColor: const Color.fromRGBO(92, 218, 189, 1),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                        ),
                        onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      );
}
