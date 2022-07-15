import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBar() {
  return AppBar(
    title: RichText(
      text: const TextSpan(
        text: 'Meu ',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 28,
        ),
        children: [
          TextSpan(
            text: 'Prontuário',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ],
      ),
    ),
    centerTitle: true,
    backgroundColor: const Color.fromRGBO(91, 217, 189, 1),
    elevation: 0,
  );
}
