import 'package:barcode_widget/barcode_widget.dart';
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

  final List<String> _medicamentoList = [];

  void removeServiceCard(index) {
    setState(() {
      _medicamentoList.remove(index);
    });
  }

  void _addMedicamento() {
    setState(() {
      _medicamentoList.add(
        medicamentoInput.text,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;

    Color iconYellowColor = const Color.fromRGBO(255, 182, 29, 1);
    Color labelTextColor = const Color.fromRGBO(120, 120, 120, 1);
    Color textColor = const Color.fromRGBO(47, 47, 47, 1);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: maxHeight * 0.10,
        title: const Text(
          'Prontuário',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(91, 217, 189, 1),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
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
                      controller: nomeInput,
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
                      controller: maeInput,
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
                      controller: paiInput,
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
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 140,
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

                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('dd/MM/yyyy')
                                          .format(pickedDate);
                                  setState(() {
                                    dataInput.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {
                                  return;
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: PhysicalModel(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            elevation: 1,
                            child: TextFormField(
                              controller: telefoneInput,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter(),
                              ],
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(6, 8, 6, 8),
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
                          controller: enderecoInput,
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
                    SizedBox(
                      width: 60.0,
                      child: PhysicalModel(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        elevation: 1,
                        child: TextField(
                          controller: numInput,
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
                      controller: cpfInput,
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
                      controller: rgInput,
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
                      textInputAction: TextInputAction.go,
                      onSubmitted: (value) {
                        _addMedicamento();
                        medicamentoInput.clear();
                      },
                      controller: medicamentoInput,
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
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            if (medicamentoInput.text.isNotEmpty) {
                              _addMedicamento();
                              medicamentoInput.clear();
                            }

                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          icon: Icon(
                            Icons.add,
                            color: iconYellowColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: _medicamentoList
                        .map((e) => _Medicamento(
                              onDelete: removeServiceCard,
                              yourText: e,
                            ))
                        .toList(),
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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text(
                        'Seu QR Code!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      content: BarcodeWidget(
                        barcode: Barcode.qrCode(),
                        data:
                            'nome:${nomeInput.text}/mae:${maeInput.text}/pai:${paiInput.text}/data:${dataInput.text}/telefone:${telefoneInput.text}/endereco:${enderecoInput.text}/num:${numInput.text}/cpf:${cpfInput.text}/rg:${rgInput.text}/medicamentos:${_medicamentoList.toString()}',
                        width: 200,
                        height: 200,
                      ),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(91, 217, 189, 1),
                          ),
                          child: const Text(
                            'Fechar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    barrierDismissible: false,
                  );
                },
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

class _Medicamento extends StatelessWidget {
  final Function(_Medicamento) onDelete;
  final String yourText;

  const _Medicamento({
    Key? key,
    required this.onDelete,
    required this.yourText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(255, 213, 125, 1),
              ),
              child: Row(
                children: [
                  Text(
                    yourText,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    icon: const Icon(Icons.close),
                    color: const Color.fromRGBO(15, 15, 15, 1),
                    iconSize: 18,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () => onDelete(this),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
