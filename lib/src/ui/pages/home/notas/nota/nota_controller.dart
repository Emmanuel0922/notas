import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotasController extends GetxController {
  final TextEditingController noteController = TextEditingController();
  final RxList<String> notes = <String>[].obs;

  navNuavaNota() {
    Get.toNamed('/nueva_nota');
  }

  void addNote() {
    String newNote = noteController.text.trim();
    if (newNote.isNotEmpty) {
      notes.add(newNote);
      update();
    }
    Get.back();
  }

  void editNoteAt(int index) {
    String updatedNote = noteController.text.trim();
    if (updatedNote.isNotEmpty) {
      notes[index] = updatedNote;
      update();
    }
    Get.back();
  }
}
