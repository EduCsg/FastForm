import 'package:fast_form_client/screens/home/components/app_bar.dart';
import 'package:fast_form_client/screens/home/components/body.dart';
import 'package:fast_form_client/screens/home/components/bottom.dart';
import 'package:flutter/material.dart';

import './components/body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildAppBar(),
      body: const BuildBody(),
      bottomNavigationBar: buildBottom(
        context,
        size,
        inputsContollers.nomeInput,
        inputsContollers.maeInput,
        inputsContollers.paiInput,
        inputsContollers.dataInput,
        inputsContollers.telefoneInput,
        inputsContollers.enderecoInput,
        inputsContollers.numInput,
        inputsContollers.cpfInput,
        inputsContollers.rgInput,
      ),
    );
  }
}
