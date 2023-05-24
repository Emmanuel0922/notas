import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/src/models/dto/user_dto.dart';
import 'package:notas/src/models/entity/notas_model.dart';
import 'package:notas/src/models/entity/usuarios_model.dart';
import 'package:notas/src/models/store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNotasController extends GetxController {
  TextEditingController titulo = TextEditingController();
  TextEditingController notas = TextEditingController();
//  Database.userBox.put(user);
  Future<void> guardar() async {
    String tituloS = titulo.text;
    String notaS = notas.text;

    if (tituloS.isEmpty) {
      Get.snackbar('Error', 'El Titulo es inválido');
      return;
    }

    if (notaS.isEmpty) {
      Get.snackbar('Error', 'La nota es inválida');
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? usuarioPrefs = prefs.getString('usuario');

    if (usuarioPrefs != null) {
      UserDto userDto = UserDto.fromJson(jsonDecode(usuarioPrefs));

      final users = Users(name: userDto.name, email: userDto.email, pass: '');
      final nota = Notas.withUser(title: tituloS, nota: notaS, usuario: users);
      Database.notasBox.put(nota);
      Get.snackbar('OK', 'Datos Guardados');
      Get.toNamed('/home');
    } else {
      Get.snackbar('Error', 'No se encontro un usuario logeado');
      // }
    }
  }
}
