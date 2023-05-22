import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'perfil_controller.dart';

class PerfilPage extends StatelessWidget {
  PerfilController con = Get.put(PerfilController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue, // Color de fondo azul
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 75,
                  backgroundImage: NetworkImage(
                      'https://static.vecteezy.com/system/resources/previews/014/296/309/non_2x/blue-verified-social-media-account-icon-approved-profile-sign-illustration-vector.jpg')),
              SizedBox(height: 16.0),
              Text(
                'Nombre de Usuario',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Descripción del perfil',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
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
