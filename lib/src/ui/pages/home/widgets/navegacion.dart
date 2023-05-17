import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navegacion extends StatelessWidget {
  const Navegacion({super.key});

  @override
  Widget build(BuildContext context) {
    var currentPage = 0.obs;
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configuración',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Persona',
        ),
      ],
      currentIndex: currentPage.value,
      onTap: (index) {
        currentPage.value = index;
      },
    );
  }
}
