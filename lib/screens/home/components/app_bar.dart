import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBar({required String title}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w900,
        color: Colors.white,
        fontSize: 30,
      ),
    ),
    centerTitle: true,
    backgroundColor: const Color.fromRGBO(91, 217, 189, 1),
    elevation: 0,
  );
}
