import 'package:flutter/material.dart';

import '../../../constants.dart';
import './imports.dart';

class BuildBody extends StatefulWidget {
  const BuildBody({Key? key}) : super(key: key);

  @override
  State<BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
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

              //nome completo
              WidgetNomeInput(nomeInput: nomeInput),

              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),

              //nome da mae
              WidgetMaeInput(maeInput: maeInput),

              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),

              //nome do pai
              WidgetPaiInput(paiInput: paiInput),

              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),

              Row(
                children: [
                  WidgetDataInput(dataInput: dataInput),
                  const SizedBox(
                    width: kDefaultPadding * 0.75,
                  ),
                  WidgetTelefoneInput(telefoneInput: telefoneInput)
                ],
              ),

              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),

              Row(
                children: [
                  WidgetEnderecoInput(enderecoInput: enderecoInput),
                  const SizedBox(
                    width: kDefaultPadding,
                  ),
                  WidgetNumInput(numInput: numInput),
                ],
              ),

              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),

              WidgetCpfInput(cpfInput: cpfInput),

              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),

              WidgetRgInput(rgInput: rgInput),

              const SizedBox(
                height: kDefaultPadding,
              ),

              //qual?
              const WidgetMedicamentoInput(),
            ]),
          ),
        ],
      ),
    );
  }
}
