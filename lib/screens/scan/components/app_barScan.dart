import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBarScan() {
  return AppBar(
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
  );
}
