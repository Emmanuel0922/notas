import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'perfil_controller.dart';

class PerfilPage extends StatelessWidget {
  PerfilController con = Get.put(PerfilController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.power_settings_new,
          color: Colors.green,
        ),
        onPressed: () => con.singOut(),
      ),
    );
  }
}
