import 'package:flutter_application_3/navbar/navbar.dart';
import 'package:flutter_application_3/screens/calender/CalenderScreen.dart';
import 'package:flutter_application_3/screens/DashboardScreen.dart';
import 'package:flutter_application_3/screens/Chat/MessageScreen.dart';
import 'package:flutter_application_3/screens/Profile/ProfileScreen.dart';
import 'package:get/get.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () =>  const Navbar()),
    GetPage(name: dashboard, page: () => const DashboardScreen()),
    GetPage(name: boking, page: () => CalendarScreen()),
    GetPage(name: profil, page: () => ProfileScreen()),
  ];

  static getanvbar() => Navbar;
  static getdashboard() => DashboardScreen;
  static getchat() => MessageScreen();
  static getbokking() => CalendarScreen();
  static getprofil() => ProfileScreen;

  static String navbar = '/';
  static String dashboard = '/dashboard';
  static String chat = '/chat';
  static String boking = '/boking';
  static String profil = '/profil';
}
