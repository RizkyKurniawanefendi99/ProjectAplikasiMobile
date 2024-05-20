import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Profil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        'assets/images/profile.png'), // Adjust the image path
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
            Divider(),
            buildSectionTitle('Akun'),
            buildCard(context, 'Profil Saya', Icons.arrow_forward_ios),
            buildCard(context, 'Rekam Medis', Icons.arrow_forward_ios),
            buildCard(context, 'Keluarga Saya', Icons.arrow_forward_ios),
            buildCard(context, 'Topik Saya', Icons.arrow_forward_ios),
            buildCard(context, 'Ubah Kata Sandi', Icons.arrow_forward_ios),
            buildCard(context, 'Ubah PIN Remedic', Icons.arrow_forward_ios),
            Divider(),
            buildSectionTitle('Aktivitas Saya'),
            buildCard(context, 'Transaksi Saya', Icons.arrow_forward_ios),
            Divider(),
            buildSectionTitle('Aplikasi Remedic'),
            buildCard(context, 'Tentang Kami', Icons.arrow_forward_ios),
            buildCard(context, 'Privasi', Icons.arrow_forward_ios),
            buildCard(context, 'Syarat & Ketentuan', Icons.arrow_forward_ios),
            buildCard(context, 'Hubungi Kami', Icons.arrow_forward_ios),
            Divider(),
            Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3,
              child: ListTile(
                title: Text('Keluar'),
                trailing: Icon(Icons.logout),
                onTap: () {
                  // Add logout functionality here
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
}
