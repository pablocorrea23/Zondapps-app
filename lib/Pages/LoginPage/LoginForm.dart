// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:zondapps_flutter/Common/MyRouters.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();
  String name = '';
  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: TextFormField(
              controller: ctrlEmail,
              focusNode: node1,
              keyboardType: TextInputType.emailAddress,
              maxLines: 1,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                // border: OutlineInputBorder(),
                // focusedBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.white))
              ),
              validator: (value) {
                String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                RegExp regExp = RegExp(pattern);
                if (value!.isEmpty) {
                  return 'Ingrese un Email válido';
                } else if (!regExp.hasMatch(value.toString())) {
                  return 'Correo Inválido';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: TextFormField(
              controller: ctrlPassword,
              focusNode: node2,
              //keyboardType: TextInputType.text,
              maxLines: 1,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white)),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Se necesita una constraseña';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Forgot password?',
            style: TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                save();
                Navigator.pushNamed(context, ROUTE_HOME);
                //FocusScope.of(context).requestFocus(node2);
                setState(() {
                  name = ctrlEmail.text.toString();
                });
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xff52f5d9))),
              child: const Text(
                'Log In',
                style: TextStyle(color: Color(0xff2b4460)),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Don’t have an account?',
            style: TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          const Text(
            'Create an Account.',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 35)
        ],
      ),
    );
  }

  save() {
    if (formKey.currentState!.validate()) {
      print('Email: $ctrlEmail');
      print('Password: $ctrlPassword');
      formKey.currentState?.reset();
    }
  }
}
