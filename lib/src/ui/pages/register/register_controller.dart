import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController nombreText = TextEditingController();
  TextEditingController correoText = TextEditingController();
  TextEditingController claveText = TextEditingController();
  void registro() {
    String name = nombreText.text;
    String email = correoText.text.trim().toLowerCase();
    String clave = correoText.text.trim();

    if (name.isEmpty) {
      Get.snackbar('Erro', 'El Nombre es invalido');
      return;
    }
    if (email.isEmpty || !email.isEmail) {
      Get.snackbar('Erro', 'El correo es invalido');
      return;
    }
    if (clave.isEmpty) {
      Get.snackbar('Erro', 'La clave es invalido');
      return;
    }
    RegExp claveValida =
        RegExp('^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}\$');
    if (!claveValida.hasMatch(clave)) {
      Get.snackbar('Error', 'La clave no cumple con los requisitos');
      return;
    }
  }
}
