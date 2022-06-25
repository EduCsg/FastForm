import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../components/input_formatters.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController dataInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;

    Color iconYellowColor = const Color.fromRGBO(255, 182, 29, 1);
    Color labelTextColor = const Color.fromRGBO(120, 120, 120, 1);
    Color textColor = const Color.fromRGBO(47, 47, 47, 1);

    return Scaffold(
      body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: maxWidth,
                color: const Color.fromRGBO(91, 217, 189, 1),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 60, bottom: 15),
                      child: Text(
                        'Prontuário',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
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
                    height: 25,
                  ),
                  //nome completo
                  PhysicalModel(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    elevation: 1,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.person,
                          color: iconYellowColor,
                        ),
                        labelText: 'Nome Completo',
                        labelStyle: TextStyle(
                          color: labelTextColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //nome da mae
                  PhysicalModel(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    elevation: 1,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.person,
                          color: iconYellowColor,
                        ),
                        labelText: 'Nome da Mãe',
                        labelStyle: TextStyle(
                          color: labelTextColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //nome do pai
                  PhysicalModel(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    elevation: 1,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.person,
                          color: iconYellowColor,
                        ),
                        label: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Nome do Pai ',
                                style: TextStyle(
                                    color: labelTextColor, fontSize: 16),
                              ),
                              TextSpan(
                                text: '(opcional)',
                                style: TextStyle(
                                    color: labelTextColor, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: labelTextColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: PhysicalModel(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            elevation: 1,
                            child: TextField(
                              controller: dataInput,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.cake_rounded,
                                  color: iconYellowColor,
                                ), //icon of text field
                                labelText: "Data",
                                labelStyle: TextStyle(
                                  color: labelTextColor,
                                  fontSize: 16,
                                ),
                              ),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime(2000),
                                    firstDate: DateTime(1920),
                                    lastDate: DateTime.now());

                                String formattedDate = DateFormat('dd/MM/yyyy')
                                    .format(pickedDate!);
                                setState(() {
                                  dataInput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: PhysicalModel(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            elevation: 1,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter(),
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.call,
                                  color: iconYellowColor,
                                ),
                                labelText: 'Telefone',
                                labelStyle: TextStyle(
                                  color: labelTextColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(children: [
                    Expanded(
                      child: PhysicalModel(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        elevation: 1,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.other_houses,
                              color: iconYellowColor,
                            ),
                            labelText: 'Endereço',
                            labelStyle: TextStyle(
                              color: labelTextColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(children: [
                      SizedBox(
                        width: 60.0,
                        child: PhysicalModel(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          elevation: 1,
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                            ],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 8, 10, 8),
                              border: InputBorder.none,
                              labelText: 'Nº',
                              labelStyle: TextStyle(
                                color: labelTextColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ]),
                  const SizedBox(
                    height: 16,
                  ),
                  PhysicalModel(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    elevation: 1,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.list_alt_rounded,
                          color: iconYellowColor,
                        ),
                        labelText: 'CPF',
                        labelStyle: TextStyle(
                          color: labelTextColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  PhysicalModel(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    elevation: 1,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        RgInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.list_alt_rounded,
                          color: iconYellowColor,
                        ),
                        labelText: 'RG',
                        labelStyle: TextStyle(
                          color: labelTextColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Text(
                        'Faz uso de algum medicamento?',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: labelTextColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  //qual?
                  PhysicalModel(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    elevation: 1,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.medication_rounded,
                          color: iconYellowColor,
                        ),
                        labelText: 'Qual?',
                        labelStyle: TextStyle(
                          color: labelTextColor,
                          fontSize: 16,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: iconYellowColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          )),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(91, 217, 189, 1),
                  fixedSize: Size(
                    maxWidth - 60,
                    35,
                  ),
                ),
                child: const Text('Salvar Alterações'),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'Você pode alterar as informações a qualquer momento',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
