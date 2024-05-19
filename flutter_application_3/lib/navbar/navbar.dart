import 'package:flutter/material.dart';
import 'package:flutter_application_3/controller/controller.dart';
import 'package:flutter_application_3/screens/DashboardScreen.dart';
import 'package:flutter_application_3/screens/Profile/ProfileScreen.dart';
import 'package:flutter_application_3/screens/Chat/MessageScreen.dart';
import 'package:flutter_application_3/screens/calender/CalenderScreen.dart';
import 'package:get/get.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final controller = Get.put(NavbarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            DashboardScreen(),
            MessageScreen(),
            CalendarScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.black,
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            items: [
              _bottombarItem(Icons.home, "Dashboard"),
              _bottombarItem(Icons.chat, "Chat Dokter"),
              _bottombarItem(Icons.calendar_today, "Boking"),
              _bottombarItem(Icons.person, "Profil"),
            ]),
      );
    });
  }
}

_bottombarItem(IconData icon, String label) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
