import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../models/entity/usuarios_model.dart';
import '../../../models/store.dart';

class LoginController extends GetxController {
  TextEditingController nombreText = TextEditingController();
  TextEditingController correoText = TextEditingController();
  TextEditingController claveText = TextEditingController();

  get sha256 => null;

  Future<void> login() async {
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

    // verificar si el usuario ya está registrado
    Users? usuarioExistente = await Database.getUserByEmail(email);
    if (usuarioExistente != null) {
      Get.snackbar(
          'Error', 'El correo ya está registrado ${usuarioExistente.email}');
      Get.toNamed('/register');
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
