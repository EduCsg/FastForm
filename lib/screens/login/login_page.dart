import 'package:fast_form/screens/home/components/body.dart';
import 'package:fast_form/screens/home/home_page.dart';
import 'package:fast_form/screens/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/components/inputs/medicamentos.dart';
import 'components/quero_escanear.dart';
import 'components/quero_preencher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

List? medicamentos = [];

class _LoginPageState extends State<LoginPage> {
  void removeServiceCard(index) {
    Navigator.of(context).pop();

    setState(() {
      lists.medicamentoListWidget.remove(index);
      lists.medicamentoListString
          .removeAt(lists.medicamentoListString.indexOf(index.yourText));
    });

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => HomePage(),
      ),
    );
  }

  setMedicamentoCache() async {
    final prefs = await SharedPreferences.getInstance();

    medicamentos = prefs.getStringList('medicamentos');

    for (var i = 0; i < medicamentos!.length; i++) {
      lists.medicamentoListString.add(
        medicamentos![i],
      );
      lists.medicamentoListWidget.add(
        Medicamento(
          onDelete: removeServiceCard,
          yourText: medicamentos![i],
        ),
      );
    }
  }

  @override
  void initState() {
    setMedicamentoCache();
    setData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app_rounded),
            onPressed: () => SystemNavigator.pop(),
            color: Colors.black,
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.info_outline_rounded),
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
