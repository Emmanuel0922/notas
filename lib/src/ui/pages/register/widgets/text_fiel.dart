import 'package:flutter/material.dart';



Widget TextFiel({
  required String hintText,
  required IconData iconData,
  required TextInputType textInputType,
  required bool obscureText,
  required TextEditingController textEditingController,
}) {
  return Container(
    
    margin: const EdgeInsets.only(top: 30, left: 50, right: 50, bottom: 5),
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
