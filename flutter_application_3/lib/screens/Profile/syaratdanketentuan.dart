import 'package:flutter/material.dart';

class SyaratDanKetentuan extends StatelessWidget {
  const SyaratDanKetentuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syarat & Ketentuan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Syarat & Ketentuan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Dengan menggunakan aplikasi REMEDIC, Anda setuju untuk mematuhi syarat dan ketentuan berikut:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '1. Penggunaan Aplikasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Aplikasi REMEDIC dirancang untuk menyediakan layanan kesehatan kepada pengguna. Anda tidak diperkenankan menggunakan aplikasi ini untuk tujuan ilegal atau tidak sah.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '2. Akun Pengguna',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Anda bertanggung jawab untuk menjaga kerahasiaan informasi akun Anda, termasuk kata sandi, dan semua aktivitas yang terjadi di bawah akun Anda.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '3. Privasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Kami berkomitmen untuk melindungi privasi Anda. Informasi pribadi yang Anda berikan melalui aplikasi ini akan digunakan sesuai dengan kebijakan privasi kami.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '4. Layanan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'REMEDIC berhak untuk mengubah, menangguhkan, atau menghentikan layanan apa pun yang disediakan melalui aplikasi ini tanpa pemberitahuan sebelumnya.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '5. Pembayaran',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Semua pembayaran untuk layanan yang tersedia di aplikasi harus dilakukan dalam mata uang lokal. Kami menerima berbagai metode pembayaran yang tersedia dalam aplikasi.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '6. Batasan Tanggung Jawab',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Kami tidak bertanggung jawab atas kerusakan langsung, tidak langsung, insidental, khusus, atau konsekuensial yang timbul dari penggunaan atau ketidakmampuan untuk menggunakan aplikasi ini.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '7. Perubahan Syarat & Ketentuan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Kami berhak untuk mengubah syarat dan ketentuan ini kapan saja. Perubahan akan berlaku segera setelah diperbarui di aplikasi.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Jika Anda memiliki pertanyaan mengenai syarat dan ketentuan ini, silakan hubungi kami melalui fitur Hubungi Kami di aplikasi.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
