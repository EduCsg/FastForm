import 'package:fast_form/screens/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/quero_escanear.dart';
import 'components/quero_preencher.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar:
          // preferredSize: const Size.fromHeight(0),
          AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnboardingPage(),
            ),
          ),
          color: Colors.black,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Escolha',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 45,
                ),
              ),
              const Text(
                'O que deseja fazer?',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: maxHeight * 0.07,
              ),
              const QueroPreencher(),
              SizedBox(
                height: maxHeight * 0.035,
              ),
              const QueroEscanear(),
            ],
          ),
        ),
      ),
    );
  }
}
