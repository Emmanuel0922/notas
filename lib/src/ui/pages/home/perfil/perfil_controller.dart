import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notas/src/models/dto/user_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilController extends GetxController {
  @override
  void onInit() {
    // super.onInit();
    //nombre = 'Pepe';
    obtenerDatos(); // Llama al método para obtener los datos al iniciar el controlador
  }

  String nombre = 'Emmanuel';

  obtenerDatos() async {
    nombre = 'Dato inicial';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? usuarioPrefs = prefs.getString('usuario');

    if (usuarioPrefs != null) {
      UserDto userDto = UserDto.fromJson(jsonDecode(usuarioPrefs));
      nombre = userDto.name;
    } else {
      print('No se encontró ningún valor');
    }
  }

  Future<void> singOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('usuario');
    Get.offNamedUntil('/', (route) => false);
  }
}
