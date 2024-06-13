import 'package:flutter/material.dart';

class Privasi extends StatelessWidget {
  const Privasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kebijakan Privasi'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kebijakan Privasi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Kami di REMEDIC menghargai privasi Anda dan berkomitmen untuk melindungi informasi pribadi Anda. Kebijakan Privasi ini menjelaskan bagaimana kami mengumpulkan, menggunakan, dan melindungi informasi Anda.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '1. Informasi yang Kami Kumpulkan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Kami dapat mengumpulkan informasi pribadi yang Anda berikan secara langsung, seperti nama, alamat, nomor telepon, dan informasi medis. Kami juga dapat mengumpulkan informasi otomatis melalui penggunaan aplikasi ini, seperti alamat IP dan data penggunaan.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '2. Penggunaan Informasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Informasi yang kami kumpulkan digunakan untuk menyediakan layanan yang Anda minta, meningkatkan layanan kami, dan berkomunikasi dengan Anda. Kami juga dapat menggunakan informasi ini untuk tujuan analisis dan penelitian.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '3. Berbagi Informasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Kami tidak akan membagikan informasi pribadi Anda kepada pihak ketiga kecuali jika diperlukan untuk menyediakan layanan yang Anda minta, mematuhi hukum yang berlaku, atau melindungi hak dan keamanan kami serta pengguna lain.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '4. Keamanan Informasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Kami mengambil langkah-langkah yang wajar untuk melindungi informasi pribadi Anda dari akses, penggunaan, atau pengungkapan yang tidak sah. Namun, tidak ada sistem yang sepenuhnya aman, dan kami tidak dapat menjamin keamanan informasi Anda secara absolut.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '5. Hak Anda',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Anda memiliki hak untuk mengakses, memperbarui, atau menghapus informasi pribadi Anda yang kami miliki. Anda juga dapat menarik persetujuan Anda atas penggunaan informasi pribadi Anda kapan saja.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '6. Perubahan Kebijakan Privasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Kami dapat memperbarui Kebijakan Privasi ini dari waktu ke waktu. Perubahan akan berlaku segera setelah kami memperbarui kebijakan di aplikasi. Kami mendorong Anda untuk meninjau Kebijakan Privasi ini secara berkala.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Jika Anda memiliki pertanyaan mengenai Kebijakan Privasi ini, silakan hubungi kami melalui fitur Hubungi Kami di aplikasi.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
