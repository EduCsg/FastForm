import 'package:flutter/material.dart';

import '../../../constants.dart';
import './imports.dart';

class BuildBody extends StatefulWidget {
  const BuildBody({Key? key}) : super(key: key);

  @override
  State<BuildBody> createState() => BuildBodyState();
}

final inputsControllersList = InputsControllers();

class BuildBodyState extends State<BuildBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: kDefaultPadding * 0.75,
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(children: [
              Text(
                "As informações contidas aqui não tem conexão nenhuma com algum banco de dados",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: labelTextColor,
                ),
              ),
              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),
              WidgetNomeInput(nomeInput: inputsControllersList.nomeInput),
              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),
              WidgetMaeInput(maeInput: inputsControllersList.maeInput),
              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),
              WidgetPaiInput(paiInput: inputsControllersList.paiInput),
              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),
              Row(
                children: [
                  WidgetDataInput(dataInput: inputsControllersList.dataInput),
                  const SizedBox(
                    width: kDefaultPadding * 0.75,
                  ),
                  WidgetTelefoneInput(
                      telefoneInput: inputsControllersList.telefoneInput)
                ],
              ),
              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),
              Row(
                children: [
                  WidgetEnderecoInput(
                      enderecoInput: inputsControllersList.enderecoInput),
                  const SizedBox(
                    width: kDefaultPadding,
                  ),
                  WidgetNumInput(numInput: inputsControllersList.numInput),
                ],
              ),
              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),
              WidgetCpfInput(cpfInput: inputsControllersList.cpfInput),
              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),
              WidgetRgInput(rgInput: inputsControllersList.rgInput),
              const SizedBox(
                height: kDefaultPadding,
              ),
              const WidgetMedicamentoInput(),
            ]),
          ),
        ],
      ),
    );
  }
}

class InputsControllers {
  TextEditingController nomeInput = TextEditingController();
  TextEditingController maeInput = TextEditingController();
  TextEditingController paiInput = TextEditingController();
  TextEditingController dataInput = TextEditingController();
  TextEditingController telefoneInput = TextEditingController();
  TextEditingController enderecoInput = TextEditingController();
  TextEditingController numInput = TextEditingController();
  TextEditingController cpfInput = TextEditingController();
  TextEditingController rgInput = TextEditingController();
  TextEditingController medicamentoInput = TextEditingController();
}
