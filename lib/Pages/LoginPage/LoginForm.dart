// ignore_for_file: file_names, avoid_print, use_build_context_synchronously, library_private_types_in_public_api
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zondapps_flutter/Common/MyRouters.dart';
import 'package:http/http.dart' as http;
import 'package:zondapps_flutter/Pages/Home/MyHomePage.dart';
import 'package:zondapps_flutter/main.dart';

void main() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.getString('token');
  runApp(MaterialApp(
    home: token == null ? const MyApp() : const MyHomePage(),
  ));
}

class PostLoginScreen extends StatefulWidget {
  const PostLoginScreen({super.key});

  @override
  _PostLoginScreenState createState() => _PostLoginScreenState();
}

class _PostLoginScreenState extends State<PostLoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool hidePassword = true;
  registerUser(String email, String password) async {
    //loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    //definimos la api y los datos
    Uri url = Uri.parse("https://gestionapp.zondapps.com/api/login");
    var data = {
      "email": email,
      "password": password,
    };

    //pop the loading circle
    //Navigator.of(context).pop();

    try {
      var response = await http.post(url, body: data);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        final token = jsonData['token'];

        Navigator.pushNamed(context, ROUTE_HOME);

        print(jsonData);
        print(jsonData['token']);
        print("Login Successfully");

        //Almacenar el token en SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        //cierra SharedPreferences
        print(prefs.getString('token'));
      } else {
        var error = jsonDecode(response.body);
        print("Unable to Login: ${error['error']}");
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    )
                  ],
                  title: const Text('Login Error'),
                  contentPadding: const EdgeInsets.all(20.0),
                  content: const Text('Ingrese un Usuario correcto'),
                ));
      }
    } catch (e) {
      print("Error: $e");
    }
  }

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
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              maxLines: 1,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
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
              controller: passwordcontroller,
              maxLines: 1,
              obscureText: hidePassword,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.white),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      color: Theme.of(context).colorScheme.onPrimary,
                      icon: Icon(hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility))),
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
                registerUser(emailController.text.toString(),
                    passwordcontroller.text.toString());

                //setState(() {});
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
}
