import 'package:flutter/material.dart';

import './components/app_bar.dart';
import './components/body.dart';
import './components/bottom.dart';

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
      appBar: buildAppBar(context),
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
