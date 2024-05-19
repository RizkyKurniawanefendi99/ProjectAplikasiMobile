import 'package:flutter/material.dart' show AlertDialog, Align, Alignment, AppBar, BorderRadius, BoxDecoration, BoxFit, BoxShadow, BoxShape, BuildContext, ClipOval, Color, Colors, Column, Container, CrossAxisAlignment, EdgeInsets, ElevatedButton, Expanded, FontWeight, Icon, IconButton, IconData, Icons, Image, LinearGradient, MainAxisAlignment, MaterialPageRoute, Navigator, Offset, Padding, Radius, Row, Scaffold, SingleChildScrollView, SizedBox, StatelessWidget, Text, TextAlign, TextButton, TextStyle, Widget, showDialog;
import 'package:flutter_application_3/screens/signin_screen.dart'; // Ganti dengan import yang sesuai
import 'package:flutter_application_3/screens/Profile/EditProfileScreen.dart'; // Import halaman edit profil

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Tambahkan logika untuk menampilkan notifikasi
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Tampilkan dialog konfirmasi logout
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Konfirmasi Logout"),
                    content: const Text("Apakah Anda yakin ingin logout?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Tutup dialog
                        },
                        child: const Text("Batal"),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigasi ke halaman login
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()),
                          );
                        },
                        child: const Text("Logout"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/pp1.png', // Ganti dengan path foto profil
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama Pengguna',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Tanggal Lahir: 10 Januari 1980',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Alamat: Jakarta, Indonesia',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Email: user@example.com',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman edit profil
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfileScreen()),
                    );
                  },
                  child: const Text('Edit Profil'),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildRoundedBox(Icons.favorite, 'Detak Jantung',
                            '75 bpm', [Colors.lightBlueAccent, Colors.blue]),
                        const SizedBox(height: 10),
                        _buildRoundedBox(
                            Icons.local_hospital,
                            'Tekanan Darah',
                            '120/80 mmHg',
                            [Colors.lightBlueAccent, Colors.blue]),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildRoundedBox(Icons.assessment, 'Gula Darah',
                            '100 mg/dL', [Colors.lightBlueAccent, Colors.blue]),
                        const SizedBox(height: 10),
                        _buildRoundedBox(Icons.eco, 'Kolesterol', '150 mg/dL',
                            [Colors.lightBlueAccent, Colors.blue]),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildRoundedBox(Icons.fitness_center, 'Berat Badan',
                            '70 kg', [Colors.lightBlueAccent, Colors.blue]),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildRoundedBox(Icons.height, 'Tinggi Badan', '170 cm',
                            [Colors.lightBlueAccent, Colors.blue]),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoundedBox(IconData icon, String parameter, String value,
      List<Color> gradientColors) {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3), 
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(height: 5),
              Text(
                parameter,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            'Perbarui ${parameter.toLowerCase()}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
