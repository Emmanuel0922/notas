import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:notas/src/ui/pages/home/notas/nota/nota_page.dart';
import 'package:notas/src/ui/pages/home/perfil/perfil_page.dart';

class HomePage extends StatelessWidget {
  var currentPage = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: currentPage.value,
            children: const [
              NotasPage(),
              PerfilPage(),
            ],
          )),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: GNav(
            backgroundColor: Colors.black,
            gap: 8,
            padding: const EdgeInsets.all(15),
            color: Colors.white,
            tabBackgroundColor: Colors.grey,
            onTabChange: (value) {
              currentPage.value = value;
            },
            tabs: const [
              GButton(
                //icon: Icons.note,
                icon: Icons.note,
                // iconSize: 40,
                text: 'personas',
                textStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
              GButton(
                icon: Icons.person,
                text: 'buscar',
                // iconSize: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
