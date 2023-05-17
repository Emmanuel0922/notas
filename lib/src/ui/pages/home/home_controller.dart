import 'package:get/get.dart';

class HomeController extends GetxController {
  var tapIndex = 0.obs;

  HomeController() {}

  void changeTapIndex(int index) {
    tapIndex = index as RxInt;
  }
}