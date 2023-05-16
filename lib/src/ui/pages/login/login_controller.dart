import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../models/entity/usuarios_model.dart';
import '../../../models/store.dart';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';

class LoginController extends GetxController {
  TextEditingController correoText = TextEditingController();
  TextEditingController claveText = TextEditingController();

  Future<void> login() async {
    String email = correoText.text.trim().toLowerCase();
    String clave = claveText.text.trim();

    if (email.isEmpty || !email.isEmail) {
      Get.snackbar('Error', 'El correo es inválido');
      return;
    }

    if (clave.isEmpty) {
      Get.snackbar('Error', 'La clave es inválida');
      return;
    }

    RegExp claveValida =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

    if (!claveValida.hasMatch(clave)) {
      Get.snackbar('Error', 'La clave no cumple con los requisitos');
      return;
    }

    String claveEncriptada = sha256.convert(utf8.encode(clave)).toString();

    // verificar si el usuario ya está registrado
    Users? usuarioExistente = await Database.getUserByEmail(email);
    if (usuarioExistente != null) {
      if (usuarioExistente.pass == claveEncriptada) {
        Get.snackbar('Exito', 'Bienvenido ${usuarioExistente.email}');
        Get.toNamed('/register');
        print('contrasena bd ${usuarioExistente.pass}');
        print('Contrasena escrita $claveEncriptada');
        return;
      }
    }

    Get.snackbar('Error', 'Datos incorrectos');
  }
}
