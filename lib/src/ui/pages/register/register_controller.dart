import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/src/models/dto/user_dto.dart';
import 'package:notas/src/models/entity/usuarios_model.dart';
import 'package:notas/src/models/store.dart';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  TextEditingController nombreText = TextEditingController();
  TextEditingController correoText = TextEditingController();
  TextEditingController claveText = TextEditingController();

  Future<void> registro() async {
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
      return;
    }

    String claveEncriptada = sha256.convert(utf8.encode(clave)).toString();

    // Crea una nueva instancia del modelo de usuario con los datos ingresados
    final user = Users(name: name, email: email, pass: claveEncriptada);

    // Guarda el nuevo usuario en el store de usuarios
    Database.userBox.put(user);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserDto userDto =
        UserDto(id: user.id, name: user.name, email: user.email, pass: '');
    String jsonString = jsonEncode(userDto.toJson());
    prefs.setString('usuario', jsonString);
    Get.offNamedUntil('/home', (route) => false);

    // Muestra una notificación de éxito
    Get.snackbar('Éxito', 'El usuario ha sido registrado exitosamente');
  }
}
