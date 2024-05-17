import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:zondapps_flutter/Common/MyRouters.dart';
import 'package:zondapps_flutter/Pages/LoginPage/LoginPage.dart';

void main() async {
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // var token = preferences.getString('token');
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      // estos 3 parametros de arriba son de la dependencia devicePreview.dart
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRouters.generateRoute,
      initialRoute: ROUTE_LOGIN,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF52f4d7)),
          useMaterial3: true,
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: Colors.white))),
      home: const LoginPage(),
    );
  }
}
