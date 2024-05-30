// ignore_for_file: file_names

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zondapps_flutter/Pages/Home/MyHomePage.dart';
import 'package:zondapps_flutter/Values/ColorsApp.dart';

class LaEmpresa extends StatelessWidget {
  const LaEmpresa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: fondoApp,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Container(
            height: 60,
            color: const Color(0xfff6f6f6),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      color: bottomBar,
                      size: 28,
                    ),
                    Text(
                      'Menu',
                      style: TextStyle(color: bottomBar),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 70),
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
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                '"En [Nombre de la Empresa], nos dedicamos a transformar visiones en realidad. Con una pasión por la excelencia y la innovación, trabajamos incansablemente para ofrecer soluciones que inspiren, conecten y superen las expectativas. Bienvenido a un mundo donde cada idea cuenta y cada cliente es parte fundamental de nuestro viaje."',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 25),
            SvgPicture.asset(
              'assets/images/laEmpresa/whatsapp.svg',
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
            const Text(
              '264 5802685',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(height: 25),
            SvgPicture.asset(
              'assets/images/laEmpresa/instagram.svg',
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
            const Text(
              '@zondapps',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(height: 25),
            SvgPicture.asset(
              'assets/images/laEmpresa/mail.svg',
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
            const Text(
              'contacto@zondapps.com',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ));
  }
}


// ClipRRect(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       child: BottomNavigationBar(
//           selectedItemColor: bottomBar,
//           unselectedItemColor: Colors.black26,
//           iconSize: 28,
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Menú'),
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Menú'),
//           ]),
//     )