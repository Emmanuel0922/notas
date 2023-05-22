import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilController extends GetxController {
  //User user = User.fromJson(GetStorage().read('user') ?? {});

  Future<void> singOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('usuario');
    Get.offNamedUntil('/', (route) => false);
  }
}
