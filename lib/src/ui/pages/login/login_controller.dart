import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notas/src/models/dto/user_dto.dart';
import '../../../models/entity/usuarios_model.dart';
import '../../../models/store.dart';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController correoText = TextEditingController();
  TextEditingController claveText = TextEditingController();
  final storage = GetStorage();

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

    // RegExp claveValida =
    //     RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

    // if (!claveValida.hasMatch(clave)) {
    //   Get.snackbar('Error', 'La clave no cumple con los requisitos');
    //   return;
    // }

    String claveEncriptada = sha256.convert(utf8.encode(clave)).toString();

    // verificar si el usuario ya está registrado
    Users? usuarioExistente = await Database.getUserByEmail(email);
    UserDto user = UserDto(
        id: usuarioExistente!.id,
        name: usuarioExistente.name,
        email: usuarioExistente.email,
        pass: '');
    if (usuarioExistente != null) {
      if (usuarioExistente.pass == claveEncriptada) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        Get.offNamedUntil('/home', (route) => false);
        prefs.setString('usuario', user.toJson().toString());

        print('usuario1 ${user.email}');
        return;
      }
    }

    Get.snackbar('Error', 'Datos incorrectos');
  }
}
