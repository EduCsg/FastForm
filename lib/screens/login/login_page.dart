import 'package:fast_form_client/constants.dart';
import 'package:flutter/material.dart';

import 'components/quero_escanear.dart';
import 'components/quero_preencher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
