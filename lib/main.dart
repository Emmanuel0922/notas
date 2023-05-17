import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/src/models/entity/usuarios_model.dart';
import 'package:notas/src/ui/pages/home/home_page.dart';
import 'package:notas/src/ui/pages/login/login_page.dart';
import 'package:notas/src/ui/pages/register/register_page.dart';
import 'package:get_storage/get_storage.dart';

import 'src/models/store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.open(); // espera a que se abra la base de datos

  runApp(const MyApp());
}

//Users myUser = Users.fromJson(GetStorage().read('user')?? {});
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //initialRoute: myUser.id != null ? '/home': '/',
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/home', page: () => HomePage()),
      ],
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
      ),
      navigatorKey: Get.key,
    );
  }
}
