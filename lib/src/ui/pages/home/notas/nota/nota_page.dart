import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/src/ui/pages/home/notas/nota/nota_controller.dart';
import 'package:notas/src/ui/widgets/widgets.dart';

// class NotasPage extends StatelessWidget {
//   NotasController con = Get.put(NotasController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(
//           Icons.add,
//           color: Colors.green,
//         ),
//         onPressed: () => con.navNuavaNota(),
//       ),

//     );
//   }
// }

class NotasPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotasPage> {
  var not1 = Get.put(NotasController());

  @override
  void dispose() {
    not1.noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
      ),
      body: not1.notes.isEmpty
          ? Center(
              child: Text(
                'No notes added',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: not1.notes.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => Card(
                    color: Colors.blue[50],
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.blue),
                    ),
                    child: ListTile(
                      title: Text(
                        not1.notes[index],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              _showEditNoteDialog(context, index);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.blue),
                            onPressed: () {
                              setState(() {
                                not1.notes.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showAddNoteDialog(context);
        },
      ),
    );
  }

  void _showAddNoteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        not1.noteController.clear();
        return AlertDialog(
          title: Text('Add a Note'),
          content: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 100, // Altura mínima del cuadro de diálogo
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: not1.noteController,
                        decoration: InputDecoration(
                          hintText: 'Enter your note',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: null, // Permite múltiples líneas
                        keyboardType: TextInputType
                            .multiline, // Habilita el teclado multilinea
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                String newNote = not1.noteController.text.trim();
                if (newNote.isNotEmpty) {
                  setState(() {
                    not1.notes.add(newNote);
                  });
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditNoteDialog(BuildContext context, int index) {
    not1.noteController.text = not1.notes[index];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Note'),
          content: TextField(
            controller: not1.noteController,
            decoration: InputDecoration(
              hintText: 'Enter your note',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text('Update'),
              onPressed: () {
                String updatedNote = not1.noteController.text.trim();
                if (updatedNote.isNotEmpty) {
                  setState(() {
                    not1.notes[index] = updatedNote;
                  });
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
