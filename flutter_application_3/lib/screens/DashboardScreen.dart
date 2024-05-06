import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/ProfileScreen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Tambahkan logika untuk menavigasi ke halaman notifikasi
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
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
                child: Center(
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
              SizedBox(
                  height: 20), // Beri jarak antara kotak promosi dan GridView
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // Tidak memungkinkan untuk discroll
                children: [
                  _buildDashboardItem(
                    context,
                    'Jadwal Dokter',
                    Icons.event,
                    Colors.blue[700]!,
                    () {
                      // Tambahkan logika untuk menavigasi ke halaman Jadwal Dokter
                    },
                  ),
                  _buildDashboardItem(
                    context,
                    'Chat Dokter',
                    Icons.chat,
                    Colors.blue[600]!,
                    () {
                      // Tambahkan logika untuk menavigasi ke halaman Chat Dokter
                    },
                  ),
                  _buildDashboardItem(
                    context,
                    'Menu Obat',
                    Icons.medication,
                    Colors.blue[500]!,
                    () {
                      // Tambahkan logika untuk menavigasi ke halaman Menu Obat
                    },
                  ),
                  _buildDashboardItem(
                    context,
                    'Menu Artikel',
                    Icons.article,
                    Colors.blue[400]!,
                    () {
                      // Tambahkan logika untuk menavigasi ke halaman Menu Artikel
                    },
                  ),
                  _buildDashboardItem(
                    context,
                    'Riwayat Penyakit',
                    Icons.history,
                    Colors.blue[300]!,
                    () {
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue[900]!,
              Colors.blue[700]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color.fromARGB(255, 0, 0, 0)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today,
                  color: Color.fromARGB(255, 0, 0, 0)),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message, color: Color.fromARGB(255, 0, 0, 0)),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Color.fromARGB(255, 0, 0, 0)),
              label: 'Profile',
            ),
          ],
          backgroundColor: Color.fromARGB(255, 0, 204, 255),
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
