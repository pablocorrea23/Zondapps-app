// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:zondapps_flutter/Pages/ProfilePage.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ElevatedButton(
            onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()))
                },
            child: const Text('perfil')),
      ),
    );
  }
}
