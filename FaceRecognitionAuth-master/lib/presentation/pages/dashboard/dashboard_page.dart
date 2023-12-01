import 'package:face_net_authentication/presentation/pages/home/home_page.dart';
import 'package:face_net_authentication/presentation/pages/personnels/add_personnel.dart';
import 'package:face_net_authentication/presentation/pages/rapport/rapport.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../gestion/gestion.dart';
import '../parametres/parametres_screen.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () => Get.to(() => AjouterPers(idCurentEttablissment: "",)),
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomePage(),
              Gestion(idCurentEttablissment: "",),
              Rapports(),
              ParametreScreen(),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.orange,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomNavigationBarItem(
                icon: "assets/images/icons/home.png", label: "home"),
            _bottomNavigationBarItem(
                icon: "assets/images/icons/gestion.png", label: "Gestion"),
            _bottomNavigationBarItem(
                icon: "assets/images/icons/calendar.png", label: "Planning"),
            _bottomNavigationBarItem(
                icon: "assets/images/icons/settings.png", label: "Parametres"),
          ],
        ),
      );
    });
  }
}

_bottomNavigationBarItem({required String icon, String? label}) {
  return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(icon)), label: label);
}
