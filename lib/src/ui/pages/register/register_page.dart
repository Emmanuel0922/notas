import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/src/ui/widgets/widgets.dart';
import 'package:notas/src/utils/my_colors.dart';

import 'register_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterController con = Get.put(RegisterController());

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'Register';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                TextFiel(
                  hintText: 'Nombre',
                  iconData: Icons.person,
                  textInputType: TextInputType.text,
                  obscureText: false,
                  textEditingController: con.nombreText,
                ),
                TextFiel(
                  hintText: 'Correo',
                  iconData: Icons.mail,
                  textInputType: TextInputType.emailAddress,
                  obscureText: false,
                  textEditingController: con.correoText,
                ),
                TextFiel(
                  hintText: 'Clave',
                  iconData: Icons.lock,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: false,
                  textEditingController: con.claveText,
                ),
                BotonRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget BotonRegister() {
  RegisterController con = Get.put(RegisterController());
  return Container(
    width: 200,
    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
    child: ElevatedButton(
      onPressed: () => con.registro(),
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
      ),
      child: const Text(
        'REGISTRASE',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
  );
}
