// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:zondapps_flutter/Values/ColorsApp.dart';

// ignore: camel_case_types
class name extends StatelessWidget {
  const name({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondoApp,
      appBar: AppBar(
        backgroundColor: fondoApp,
        title: const Text(
          'PERFIL',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
    );
  }
}

//la vista de esta pantalla va a estar trabajada en profilePage