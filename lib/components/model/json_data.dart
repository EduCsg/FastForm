import 'package:json_annotation/json_annotation.dart';

import '../../screens/home/components/body.dart';
import '../../screens/home/components/imports.dart';

part 'json_data.g.dart';

@JsonSerializable()
class JsonData {
  final String nome;
  final String nomeMae;
  final String nomePai;
  final String aniversario;
  final String telefone;
  final String endereco;
  final String numero;
  final String cpf;
  final String rg;
  final String medicamentos;

  const JsonData({
    required this.nome,
    required this.nomeMae,
    required this.nomePai,
    required this.aniversario,
    required this.telefone,
    required this.endereco,
    required this.numero,
    required this.cpf,
    required this.rg,
    required this.medicamentos,
  });

  Map<String, dynamic> toJson() => _$JsonDataToJson(this);

  @override
  String toString() =>
      'Data{name: $nome, mae: $nomeMae, pai: $nomePai, aniversario: $aniversario, telefone: $telefone, endereco: $endereco, numero: $numero, cpf: $cpf, rg: $rg, medicamentos: $medicamentos}';
}

final jsonData = JsonData(
  nome: inputsContollers.nomeInput.text.toString(),
  nomeMae: inputsContollers.maeInput.text.toString(),
  nomePai: inputsContollers.paiInput.text.toString(),
  aniversario: inputsContollers.dataInput.text.toString(),
  telefone: inputsContollers.telefoneInput.text.toString(),
  endereco: inputsContollers.enderecoInput.text.toString(),
  numero: inputsContollers.numInput.text.toString(),
  cpf: inputsContollers.cpfInput.text.toString(),
  rg: inputsContollers.rgInput.text.toString(),
  medicamentos: lists.medicamentoListString.toString(),
);
