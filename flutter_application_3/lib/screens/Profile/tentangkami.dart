import 'package:flutter/material.dart';

class TentangKami extends StatelessWidget {
  const TentangKami({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Kami'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tentang REMEDIC',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'REMEDIC adalah platform kesehatan inovatif yang bertujuan untuk menyediakan akses mudah dan cepat ke layanan medis. Kami memahami bahwa kesehatan adalah hal yang sangat penting, dan kami berkomitmen untuk membantu Anda mendapatkan perawatan yang Anda butuhkan kapan saja dan di mana saja.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Misi Kami',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Misi kami adalah untuk meningkatkan kualitas hidup dengan menyediakan solusi kesehatan yang terjangkau dan dapat diakses oleh semua orang. Kami percaya bahwa setiap individu berhak mendapatkan perawatan kesehatan terbaik.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Layanan Kami',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'REMEDIC menawarkan berbagai layanan termasuk konsultasi dokter online, pemantauan kesehatan, rekam medis digital, dan banyak lagi. Kami bekerja sama dengan profesional medis terbaik untuk memastikan bahwa Anda mendapatkan perawatan yang tepat dan berkualitas.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Tim Kami',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Tim kami terdiri dari dokter, ahli kesehatan, dan pengembang teknologi yang berdedikasi untuk memberikan layanan terbaik. Kami selalu berusaha untuk berinovasi dan meningkatkan layanan kami untuk memenuhi kebutuhan Anda.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Kontak Kami',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Jika Anda memiliki pertanyaan atau membutuhkan bantuan, jangan ragu untuk menghubungi kami melalui fitur Hubungi Kami di aplikasi. Kami siap membantu Anda dengan segala kebutuhan kesehatan Anda.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Terima kasih telah mempercayai REMEDIC sebagai mitra kesehatan Anda.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
