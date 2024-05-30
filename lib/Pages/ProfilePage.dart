// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:zondapps_flutter/Values/ColorsApp.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
