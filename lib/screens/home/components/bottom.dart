import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class BuildBottom extends StatelessWidget {
  const BuildBottom({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kDefaultPadding * 5,
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
                      data: "JSON",
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
                  size.width - 60,
                  35,
                ),
              ),
              child: const Text('Salvar Alterações'),
            ),
            const SizedBox(
              height: kDefaultPadding * 0.25,
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
    );
  }
}
