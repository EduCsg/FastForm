import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

saveData() async {
  final prefs = await SharedPreferences.getInstance();

  //salva no cache
  prefs.setString('nome', inputsControllersList.nomeInput.text);
  prefs.setString('mae', inputsControllersList.maeInput.text);
  prefs.setString('pai', inputsControllersList.paiInput.text);
  prefs.setString('nasc', inputsControllersList.dataInput.text);
  prefs.setString('telefone', inputsControllersList.telefoneInput.text);
  prefs.setString('endereco', inputsControllersList.enderecoInput.text);
  prefs.setString('num', inputsControllersList.numInput.text);
  prefs.setString('cpf', inputsControllersList.cpfInput.text);
  prefs.setString('rg', inputsControllersList.rgInput.text);

  prefs.setStringList('medicamentos', lists.medicamentoListString);
}

setData() async {
  final prefs = await SharedPreferences.getInstance();

  //resgata os valores dentro do cache
  String nome = prefs.getString('nome').toString();
  String mae = prefs.getString('mae').toString();
  String pai = prefs.getString('pai').toString();
  String nasc = prefs.getString('nasc').toString();
  String telefone = prefs.getString('telefone').toString();
  String endereco = prefs.getString('endereco').toString();
  String num = prefs.getString('num').toString();
  String cpf = prefs.getString('cpf').toString();
  String rg = prefs.getString('rg').toString();

  //cola valores nos inputs
  inputsControllersList.nomeInput.text = nome;
  inputsControllersList.maeInput.text = mae;
  inputsControllersList.paiInput.text = pai;
  inputsControllersList.dataInput.text = nasc;
  inputsControllersList.telefoneInput.text = telefone;
  inputsControllersList.enderecoInput.text = endereco;
  inputsControllersList.numInput.text = num;
  inputsControllersList.cpfInput.text = cpf;
  inputsControllersList.rgInput.text = rg;
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
