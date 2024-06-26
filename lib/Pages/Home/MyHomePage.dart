// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zondapps_flutter/Common/MyRouters.dart';
import 'package:zondapps_flutter/Pages/Home/Menu/BottomNavigatorBar.dart';
import 'package:zondapps_flutter/Pages/Home/Menu/Fragments/Menu.dart';
import 'package:zondapps_flutter/Pages/NotificationsPage.dart';
import 'package:zondapps_flutter/Pages/ProfilePage.dart';
import 'package:zondapps_flutter/Values/ColorsApp.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List fragments = [
    const Menu(),
    const NotificationsPage(),
    const ProfilePage()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: fondoApp,
        appBar: AppBar(
          backgroundColor: fondoApp,
          title: SvgPicture.asset(
            'assets/images/MyHomePage/appBarLogo.svg',
            width: 30,
            height: 30,
            // fit: BoxFit.contain,
          ),
          centerTitle: true,
          // shadowColor: Colors.white,
          actions: [
            // Icon(
            //   Icons.more_horiz,
            //   color: Colors.white,
            //   size: 30,
            // )
            IconButton(
                onPressed: () async {
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  preferences.clear();
                  Navigator.pushNamed(context, ROUTE_LOGIN);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        bottomNavigationBar: BottomNavigatorBar(onTab, currentIndex),
        body: fragments[currentIndex]);
  }

  onTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}


// ElevatedButton(
//             onPressed: () => {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const NotificationsPage()))
//                 },
//             child: const Text('Notificaciones')),