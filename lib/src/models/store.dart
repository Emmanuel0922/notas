import 'package:notas/objectbox.g.dart';
import 'package:notas/src/models/entity/notas_model.dart';
import 'package:notas/src/models/entity/usuarios_model.dart';
import 'package:path_provider/path_provider.dart';

class Database {
  static late Store _store;

  static Future<void> open() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final path = '${appDocumentDir.path}/notas';

    _store = Store(getObjectBoxModel(), directory: path);
  }

  static Box<Users> get userBox => _store.box<Users>();
  static Box<Notas> get personasBox => _store.box<Notas>();

  static Future<Users?> getUserByEmail(String email) async {
    final query = userBox.query(Users_.email.equals(email)).build();
    final results = query.find();
    if (results.isEmpty) {
      return null;
    }
    return results.first;
  }
}
