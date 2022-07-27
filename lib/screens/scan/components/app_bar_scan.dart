import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget buildAppBarScan(context) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    title: RichText(
      text: const TextSpan(
        text: 'Prontuário ',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.white,
          fontSize: 30,
        ),
        children: [
          TextSpan(
            text: 'Escaneado',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
          ),
        ],
      ),
    ),
    centerTitle: true,
    backgroundColor: const Color.fromRGBO(242, 108, 108, 1),
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_rounded),
      onPressed: () => Navigator.of(context).pop(),
    ),
  );
}
