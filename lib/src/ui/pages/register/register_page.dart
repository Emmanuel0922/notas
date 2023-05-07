import 'package:flutter/material.dart';
import 'package:notas/src/utils/my_colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'Register';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          _textFielNombre(
            hintText: 'Nombre',
            iconData: Icons.person,
          ),
        ],
      ),
    );
  }
}

Widget _textFielNombre({
  required String hintText,
  required IconData iconData,
}) {
  return Container(
    margin: EdgeInsets.only(top: 30, left: 50, right: 50, bottom: 5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextFormField(
      //controller: con.emailController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(
            iconData,
            color: Colors.black,
          )),
    ),
  );
}
