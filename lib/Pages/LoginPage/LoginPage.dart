// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zondapps_flutter/Pages/LoginPage/LoginForm.dart';

import 'package:zondapps_flutter/Values/ColorsApp.dart';
// import 'package:zondapps_flutter/Common/MyRouters.dart';
// import 'package:zondapps_flutter/Values/ColorsApp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: testHex,
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            const SizedBox(height: 150),
            SvgPicture.asset(
              'assets/images/LoginPage/logo.svg',
              height: 150,
              width: 150,
            ),
            const PostLoginScreen()
          ]),
        ),
      ),
    );
  }
}

// ElevatedButton(
//             onPressed: () => {Navigator.pushNamed(context, ROUTE_HOME)},
//             child: const Text('Iniciar Sesión')),
