import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/src/ui/pages/home/notas/nota/add_notas/add_notas_controller.dart';
import 'package:notas/src/ui/widgets/widgets.dart';

class AddNota extends StatelessWidget {
  AddNotasController con = Get.put(AddNotasController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva nota'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFiel(
              hintText: 'Titulo',
              iconData: Icons.title,
              textInputType: TextInputType.text,
              obscureText: false,
              textEditingController: con.titulo,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width *
                  0.9, // Ancho del 90% de la pantalla
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Alineación del texto en la parte superior izquierda
                children: [
                  TextField(
                    //color: Colors.white,
                    maxLines: null, // Permite múltiples líneas
                    minLines: 8,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      hintText: 'Ingresa tu texto',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.snackbar('Error', 'La clave es inválida');
                      },
                      child: Boton(
                        titulo: 'Guardar',
                        function: () {
                          Get.snackbar('Error', 'La clave es inválida');
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
