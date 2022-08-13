import 'package:flutter/material.dart';

import 'imports.dart';

Column informacoesCorretas(
    TextEditingController nomeInput,
    TextEditingController maeInput,
    TextEditingController paiInput,
    TextEditingController dataInput,
    TextEditingController telefoneInput,
    TextEditingController enderecoInput,
    TextEditingController numInput,
    TextEditingController cpfInput,
    TextEditingController rgInput) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 6,
      ),
      Text('Nome Completo: ${nomeInput.text}'),
      const SizedBox(
        height: 6,
      ),
      Text('Nome da Mãe: ${maeInput.text}'),
      const SizedBox(
        height: 6,
      ),
      paiInput.text.isNotEmpty
          ? Column(
              children: [
                Text('Nome do Pai: ${paiInput.text}'),
                const SizedBox(
                  height: 6,
                ),
              ],
            )
          : const SizedBox(
              height: 0,
            ),
      Text('Data de Nascimento: ${dataInput.text}'),
      const SizedBox(
        height: 6,
      ),
      Text('Telefone: ${telefoneInput.text}'),
      const SizedBox(
        height: 6,
      ),
      Text('Endereço: ${enderecoInput.text}'),
      const SizedBox(
        height: 6,
      ),
      Text('Número da casa: ${numInput.text}'),
      const SizedBox(
        height: 6,
      ),
      Text('CPF: ${cpfInput.text}'),
      const SizedBox(
        height: 6,
      ),
      Text('RG: ${rgInput.text}'),
      const SizedBox(
        height: 6,
      ),
      lists.medicamentoListString.isEmpty
          ? const SizedBox(
              height: 0,
            )
          : Text(
              'Seus Medicamentos Controlados: \n${lists.medicamentoListString.toString().replaceAll('[', '').replaceAll(']', '')}'),
    ],
  );
}
