import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/src/ui/pages/register/register_controller.dart';
import 'package:notas/src/utils/my_colors.dart';

String hint = '';

Widget TextFiel({
  required String hintText,
  required IconData iconData,
  required TextInputType textInputType,
  required bool obscureText,
  required TextEditingController textEditingController,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 30),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextFormField(
      controller: textEditingController,
      keyboardType: textInputType,
      style: const TextStyle(
        color: Colors.black, // Cambiar a cualquier color deseado
      ),
      obscureText: obscureText,
      decoration: InputDecoration(
          focusColor: Colors.black,
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
          prefixIcon: Icon(
            iconData,
            color: Colors.black,
          )),
    ),
  );
}

Widget Boton({required String titulo, required VoidCallback function}) {
  return Container(
    width: 200,
    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
    child: ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      child: Text(
        titulo,
        style: const TextStyle(color: Colors.black),
      ),
    ),
  );
}
