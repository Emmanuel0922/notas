import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/src/models/entity/usuarios_model.dart';
import 'package:notas/src/models/store.dart';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';

class RegisterController extends GetxController {
  TextEditingController nombreText = TextEditingController();
  TextEditingController correoText = TextEditingController();
  TextEditingController claveText = TextEditingController();

  void registro() {
    String name = nombreText.text;
    String email = correoText.text.trim().toLowerCase();
    String clave = correoText.text.trim();

    if (name.isEmpty) {
      Get.snackbar('Error', 'El Nombre es inválido');
      return;
    }
    if (email.isEmpty || !email.isEmail) {
      Get.snackbar('Error', 'El correo es inválido');
      return;
    }
    if (clave.isEmpty) {
      Get.snackbar('Error', 'La clave es inválida');
      return;
    }
    RegExp claveValida = RegExp(r'^.{8,}$');

    if (!claveValida.hasMatch(clave)) {
      Get.snackbar('Error', 'La clave no cumple con los requisitos');
      return;
    }

    // Verificar si el correo ya está registrado
    final usersExis = Database.getUserByEmail(email);
    if (usersExis != null) {
      Get.snackbar('Error', 'El correo ya está registrado');
      return;
    }

    String claveEncriptada = sha256.convert(utf8.encode(clave)).toString();

    // Crea una nueva instancia del modelo de usuario con los datos ingresados
    final user = Users(name: name, email: email, pass: claveEncriptada);

    // Guarda el nuevo usuario en el store de usuarios
    Database.userBox.put(user);

    // Muestra una notificación de éxito
    Get.snackbar('Éxito', 'El usuario ha sido registrado exitosamente');
  }
}
