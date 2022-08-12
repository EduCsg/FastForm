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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
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
      ),
    );
  }
}
