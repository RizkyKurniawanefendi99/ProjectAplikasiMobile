import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Artikel/ArticleHomecopy.dart';
import 'package:flutter_application_3/screens/buy/BuyDrugScreen.dart';
import 'package:flutter_application_3/screens/calender/CalenderScreen.dart';
import 'package:flutter_application_3/screens/Profile/ProfileScreen.dart';
import 'package:flutter_application_3/screens/Record/NotificationScreen.dart';
import 'package:flutter_application_3/screens/Chat/MessageScreen.dart';
import 'package:flutter_application_3/screens/recordmedic/RecordMedic.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        NotificationScreen()), // ProfileScreen adalah nama kelas halaman profil Anda
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            // Di dalam onPressed untuk IconButton profil
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProfileScreen()), // ProfileScreen adalah nama kelas halaman profil Anda
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200, // Atur tinggi sesuai kebutuhan
                decoration: BoxDecoration(
                  color: Colors.blue, // Atur warna sesuai kebutuhan
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Promosi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  height: 20), // Beri jarak antara kotak promosi dan GridView
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Tidak memungkinkan untuk discroll
                children: [
                  _buildDashboardItem(
                    context,
                    'Jadwal Dokter',
                    Icons.event,
                    Colors.blue[700]!,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalendarScreen()),
                      );
                      // Tambahkan logika untuk menavigasi ke halaman Jadwal Dokter
                    },
                  ),
                  _buildDashboardItem(
                    context,
                    'Chat Dokter',
                    Icons.chat,
                    Colors.blue[600]!,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MessageScreen()),
                      );

                      // Tambahkan logika untuk menavigasi ke halaman Chat Dokter
                    },
                  ),
                  _buildDashboardItem(
                    context,
                    'Menu Obat',
                    Icons.medication,
                    Colors.blue[500]!,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuyDrugScreen()),
                      );

                      // Tambahkan logika untuk menavigasi ke halaman Menu Obat
                    },
                  ),
                  _buildDashboardItem(
                    context,
                    'Menu Artikel',
                    Icons.article,
                    Colors.blue[400]!,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InstagramDashboard()),
                      );
                      // Tambahkan logika untuk menavigasi ke halaman Menu Artikel
                    },
                  ),
                  _buildDashboardItem(
                    context,
                    'Riwayat Penyakit',
                    Icons.history,
                    Colors.blue[300]!,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RecordMedic()),
                      );
                      // Tambahkan logika untuk menavigasi ke halaman Riwayat Penyakit
                    },
                  ),
                  _buildDashboardItem(
                    context,
                    'Booking',
                    Icons.calendar_today,
                    Colors.blue[200]!,
                    () {
                      // Tambahkan logika untuk menavigasi ke halaman Booking
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardItem(
    BuildContext context,
    String title,
    IconData iconData,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.8), color.withOpacity(0.5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: ListTile(
            leading: Icon(
              iconData,
              color: Colors.white,
              size: 36.0,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
