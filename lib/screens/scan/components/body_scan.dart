import 'package:flutter/material.dart';

import '../../../constants.dart';
import './imports.dart';

class BuildBodyScan extends StatefulWidget {
  const BuildBodyScan({Key? key}) : super(key: key);

  @override
  State<BuildBodyScan> createState() => BuildBodyScanState();
}

final inputsContollersScan = InputsControllersScan();

class BuildBodyScanState extends State<BuildBodyScan> {
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
                "As informações contidas aqui são recebidas a partir\ndo QR-CODE gerado na via do cliente.",
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
              WidgetNomeInput(nomeInput: inputsContollersScan.nomeInput),

              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),

              //nome da mae
              WidgetMaeInput(maeInput: inputsContollersScan.maeInput),

              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),

              //nome do pai
              WidgetPaiInput(paiInput: inputsContollersScan.paiInput),

              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),

              Row(
                children: [
                  WidgetDataInput(dataInput: inputsContollersScan.dataInput),
                  const SizedBox(
                    width: kDefaultPadding * 0.75,
                  ),
                  WidgetTelefoneInput(
                      telefoneInput: inputsContollersScan.telefoneInput)
                ],
              ),

              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),

              Row(
                children: [
                  WidgetEnderecoInput(
                      enderecoInput: inputsContollersScan.enderecoInput),
                  const SizedBox(
                    width: kDefaultPadding,
                  ),
                  WidgetNumInput(numInput: inputsContollersScan.numInput),
                ],
              ),

              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),

              WidgetCpfInput(cpfInput: inputsContollersScan.cpfInput),

              const SizedBox(
                height: kDefaultPadding * 0.75,
              ),

              WidgetRgInput(rgInput: inputsContollersScan.rgInput),

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

class InputsControllersScan {
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
