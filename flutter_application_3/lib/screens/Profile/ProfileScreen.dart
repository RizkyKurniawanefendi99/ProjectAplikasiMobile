import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Artikel/article.dart';
import 'package:flutter_application_3/screens/HealthMonotoring/HealthMonitoring.dart';
import 'package:flutter_application_3/screens/Profile/hubungikami.dart';
import 'package:flutter_application_3/screens/Profile/privasi.dart';
import 'package:flutter_application_3/screens/Profile/profilsaya.dart';
import 'package:flutter_application_3/screens/Profile/syaratdanketentuan.dart';
import 'package:flutter_application_3/screens/Profile/tentangkami.dart';
import 'package:flutter_application_3/screens/recordmedic/RecordMedicDashboard.dart';
import 'package:flutter_application_3/screens/signin_screen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Profil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profile.png'), // Adjust the image path
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Adm Rizky Efendi Oioi JR',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text('0896-8601-3385'),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            buildSectionTitle('Akun'),
            buildCardWithNavigation(context, 'Profil Saya', Icons.arrow_forward_ios, ProfilePage()),
            buildCardWithNavigation(context, 'Rekam Medis', Icons.arrow_forward_ios, RecordMedicDashboard()),
            buildCardWithNavigation(context, 'Health Monitoring', Icons.arrow_forward_ios, HealthMonitoringMain()),
            buildCardWithNavigation(context, 'Topik Saya', Icons.arrow_forward_ios, HomePage()),

            const Divider(),
            buildSectionTitle('Aktivitas Saya'),
            buildCard(context, 'Transaksi Saya', Icons.arrow_forward_ios),
            const Divider(),
            buildSectionTitle('Aplikasi Remedic'),
            buildCardWithNavigation(context, 'Tentang Kami', Icons.arrow_forward_ios, TentangKami()),
            buildCardWithNavigation(context, 'Privasi', Icons.arrow_forward_ios, Privasi()),
            buildCardWithNavigation(context, 'Syarat & Ketentuan', Icons.arrow_forward_ios, SyaratDanKetentuan()),
            buildCardWithNavigation(context, 'Hubungi Kami', Icons.arrow_forward_ios, HubungiKami()),
            const Divider(),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3,
              child: ListTile(
                title: const Text('Keluar'),
                trailing: const Icon(Icons.logout),
                onTap: () {
                Navigator.push(
                  context,
                     MaterialPageRoute(
                     builder: (context) => SignInScreen(),
                   ),
                );  // Add logout functionality here
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String title, IconData trailingIcon) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: ListTile(
        title: Text(title),
        trailing: Icon(trailingIcon),
        onTap: () {
          // Add navigation functionality here
        },
      ),
    );
  }

  Widget buildCardWithNavigation(BuildContext context, String title, IconData trailingIcon, Widget destination) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: ListTile(
        title: Text(title),
        trailing: Icon(trailingIcon),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}
