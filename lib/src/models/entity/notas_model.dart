import 'package:objectbox/objectbox.dart';

import 'usuarios_model.dart';

@Entity()
class Notas {
  @Id()
  int id = 0;

  String title;
  String nota;

  // Relación Many-to-One: una nota pertenece a un solo usuario
  final usuario = ToOne<Users>();


  Notas({required this.title, required this.nota});

  // Constructor adicional para crear la instancia de Notas con el usuario asociado
  Notas.withUser({required this.title, required this.nota, required Users usuario}) {
    this.usuario.target = usuario;
  }
}
