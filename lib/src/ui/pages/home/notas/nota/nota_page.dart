import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/src/ui/pages/home/notas/nota/nota_controller.dart';
import 'package:notas/src/ui/widgets/widgets.dart';

class NotasPage extends StatelessWidget {
  NotasController con = Get.put(NotasController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.green,
        ),
        onPressed: () => con.navNuavaNota(),
      ),
    );
  }
}
