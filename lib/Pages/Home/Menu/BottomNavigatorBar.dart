// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:zondapps_flutter/Values/ColorsApp.dart';

typedef VoidCallbackParam = Function(int index);

// ignore: must_be_immutable
class BottomNavigatorBar extends StatelessWidget {
  VoidCallbackParam voidCallbackParam;
  int currentIndex;
  BottomNavigatorBar(this.voidCallbackParam, this.currentIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: BottomNavigationBar(
          onTap: voidCallbackParam,
          currentIndex: currentIndex,
          selectedItemColor: bottomBar,
          unselectedItemColor: Colors.black26,
          iconSize: 28,
          // selectedLabelStyle: TextStyle(fontSize: 25), (aca modificamos el tamaño del texto seleccionado y deseleccionado)
          // unselectedLabelStyle: TextStyle(fontSize: 25),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Menú'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notificaciones',),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ]),
    );
  }
}
