import 'package:fast_form/screens/home/components/home_button.dart';
import 'package:flutter/material.dart';

import './components/app_bar.dart';
import './components/body.dart';
import 'components/bottom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildAppBar(context),
      body: const BuildBody(),
      floatingActionButton: buildHomeButton(
        context,
        size,
        inputsControllersList.nomeInput,
        inputsControllersList.maeInput,
        inputsControllersList.paiInput,
        inputsControllersList.dataInput,
        inputsControllersList.telefoneInput,
        inputsControllersList.enderecoInput,
        inputsControllersList.numInput,
        inputsControllersList.cpfInput,
        inputsControllersList.rgInput,
      ),
      bottomNavigationBar: BuildBottomHome(),
    );
  }
}
