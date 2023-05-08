import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/src/ui/pages/login/login_page.dart';
import 'package:notas/src/ui/pages/register/register_page.dart';

import 'src/models/store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.open(); // espera a que se abra la base de datos

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        // GetPage(name: '/third', page: () => Third()),
        // GetPage(name: "/fourth", page: () => Fourth()),
      ],
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
      ),
      navigatorKey: Get.key,
    );
  }
}
