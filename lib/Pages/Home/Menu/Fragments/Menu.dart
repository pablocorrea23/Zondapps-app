// ignore_for_file: file_names, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:zondapps_flutter/Common/MyRouters.dart';
import 'package:zondapps_flutter/Pages/EmpresaPage.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  void initState() {
    super.initState();
    // checkToken();
  }

  // void checkToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('token');

  //   if (token == null) {
  //     Navigator.pushReplacementNamed(context, ROUTE_LOGIN);
  //     print('Token NULL');
  //   } else {
  //     Navigator.pushReplacementNamed(context, ROUTE_HOME);
  //     print('Token Successfully');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView(
          // ignore: sort_child_properties_last
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LaEmpresa()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/MyHomePage/Menu/rosaIcon.svg',
                      height: 100,
                      width: 100,
                    ),
                    SvgPicture.asset(
                      'assets/images/MyHomePage/Menu/vikyIcon.svg',
                      height: 25,
                      width: 25,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF937c50)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/MyHomePage/Menu/abanico.svg',
                    height: 80,
                    width: 80,
                  ),
                  const Text(
                    'AGENDA',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFf1ce40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/MyHomePage/Menu/playVideo.svg',
                    height: 100,
                    width: 100,
                  ),
                  const Text(
                    'VIDEOS',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF6adcce)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/MyHomePage/Menu/simboloPeso.svg',
                    height: 100,
                    width: 100,
                  ),
                  const Text(
                    'PAGOS',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
          ],
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20)),
    );
  }
}
