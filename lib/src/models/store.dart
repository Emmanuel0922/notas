
import 'package:notas/objectbox.g.dart';
import 'package:notas/src/models/entity/notas_model.dart';
import 'package:notas/src/models/entity/usuarios_model.dart';
import 'package:path_provider/path_provider.dart';

class Database {
  static late Store _store;

  static Future<void> open() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final path = '${appDocumentDir.path}/objectbox';

    _store = Store(getObjectBoxModel(), directory: path);
  }

  static Box<Users> get userBox => _store.box<Users>();
  static Box<Notas> get personasBox => _store.box<Notas>();
}