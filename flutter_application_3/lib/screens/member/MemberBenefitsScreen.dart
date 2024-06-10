import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Chat/MessageScreen.dart';
import 'package:flutter_application_3/screens/member/SubscriptionPage.dart';

class MemberBenefitsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Kembali ke halaman sebelumnya
            Navigator.pop(context);
          },
        ),
        title: Text('REPROTEKSI'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Paket Unlimited Chat Dokter Spesialis Paling Terjangkau',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MessageScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[300],
                              ),
                              child: Text(
                                'Chat Dokter',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Pilihan Dokter Terlengkap',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      for (var doctor in _doctors)
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            leading: Icon(_getDoctorIcon(doctor['specialty']!)), // Pindahkan icon ke samping kiri
                            title: Text(doctor['name']!),
                            subtitle: Text(doctor['specialty']!),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Keuntungan Lainnya',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1. Akses ke dokter spesialis 24 jam.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '2. Konsultasi tanpa batas dengan dokter pilihan.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '3. Pengiriman obat gratis ke seluruh Indonesia.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Informasi Lainnya',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      for (var info in _infoList)
                        ExpansionTile(
                          title: Text(info['title']!),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                info['description']!,
                                // Hapus format bold pada kalimat FAQ
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubscriptionPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                        ),
                        child: Text('Daftar Sekarang'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getDoctorIcon(String specialty) {
    switch (specialty) {
      case 'Spesialis Anak':
        return Icons.child_care;
      case 'Spesialis Kulit':
        return Icons.local_hospital;
      case 'Spesialis Kandungan':
        return Icons.pregnant_woman;
      case 'Spesialis Penyakit Dalam':
        return Icons.healing;
      case 'Psikolog':
        return Icons.psychology;
      case 'Spesialis Kedokteran Jiwa':
        return Icons.psychology_alt;
      case 'Spesialis Mata':
        return Icons.visibility;
      case 'Spesialis THT':
        return Icons.hearing;
      case 'Spesialis Syaraf':
        return Icons.memory;
      case 'Dokter Hewan':
        return Icons.pets;
      default:
        return Icons.person;
    }
  }
}

final List<Map<String, String>> _doctors = [
  {
    'name': 'Spesialis Anak',
    'specialty': 'Spesialis Anak',
    'imageUrl': 'https://via.placeholder.com/150',
  },
  {
    'name': 'Spesialis Kulit',
    'specialty': 'Spesialis Kulit',
    'imageUrl': 'https://via.placeholder.com/150',
  },
  {
    'name': 'Spesialis Kandungan',
    'specialty': 'Spesialis Kandungan',
    'imageUrl': 'https://via.placeholder.com/150',
  },
  {
    'name': 'Spesialis Penyakit Dalam',
    'specialty': 'Spesialis Penyakit Dalam',
    'imageUrl': 'https://via.placeholder.com/150',
  },
  {
    'name': 'Psikolog',
    'specialty': 'Psikolog',
    'imageUrl': 'https://via.placeholder.com/150',
  },
  {
    'name': 'Spesialis Kedokteran Jiwa',
    'specialty': 'Spesialis Kedokteran Jiwa',
    'imageUrl': 'https://via.placeholder.com/150',
  },
  {
    'name': 'Spesialis Mata',
    'specialty': 'Spesialis Mata',
    'imageUrl': 'https://via.placeholder.com/150',
  },
  {
    'name': 'Spesialis THT',
    'specialty': 'Spesialis THT',
    'imageUrl': 'https://via.placeholder.com/150',
  },
  {
    'name': 'Spesialis Syaraf',
    'specialty': 'Spesialis Syaraf',
    'imageUrl': 'https://via.placeholder.com/150',
  },
  {
    'name': 'Dokter Hewan',
    'specialty': 'Dokter Hewan',
    'imageUrl': 'https://via.placeholder.com/150',
  },
];

final List<Map<String, String>> _infoList = [
  {
    'title': 'Cara Pembayaran',
    'description': 'Pembayaran dapat dilakukan melalui berbagai metode termasuk kartu kredit, transfer bank, dan e-wallet. Setelah memilih paket berlangganan, ikuti petunjuk di aplikasi untuk menyelesaikan pembayaran. Semua pembayaran harus dilakukan dalam mata uang lokal.',
  },
  {
    'title': 'Syarat & Ketentuan',
    'description': 'Dengan berlangganan, Anda menyetujui semua syarat dan ketentuan yang berlaku, termasuk kebijakan privasi dan penggunaan layanan. Harap baca semua syarat dan ketentuan dengan seksama sebelum mendaftar untuk memastikan Anda memahami hak dan kewajiban Anda sebagai anggota.',
  },
  {
    'title': 'FAQ',
    'description': '''
Bagaimana cara mendaftar sebagai anggota?
Jawaban: Untuk mendaftar sebagai anggota, unduh aplikasi kami dari App Store atau Google Play Store. Buka aplikasi dan ikuti langkah-langkah pendaftaran yang tersedia. Anda akan diminta untuk mengisi informasi pribadi dan menyelesaikan proses verifikasi.

Apa saja metode pembayaran yang diterima?
Jawaban: Kami menerima berbagai metode pembayaran termasuk kartu kredit, transfer bank, dan e-wallet. Pilih metode pembayaran yang paling nyaman bagi Anda dan ikuti petunjuk di aplikasi untuk menyelesaikan pembayaran.

Bagaimana cara mengakses fitur chat dengan dokter?
Jawaban: Setelah Anda menjadi anggota, Anda dapat mengakses fitur chat dengan dokter melalui menu utama di aplikasi. Pilih dokter spesialis yang Anda butuhkan dan mulai percakapan kapan saja, 24 jam sehari.

Apakah saya bisa mengganti paket berlangganan saya?
Jawaban: Ya, Anda dapat mengganti paket berlangganan Anda kapan saja melalui pengaturan akun di aplikasi. Pilih paket baru yang Anda inginkan dan ikuti petunjuk untuk memperbarui langganan Anda.

Bagaimana cara menghubungi layanan pelanggan?
Jawaban: Jika Anda memerlukan bantuan, Anda dapat menghubungi layanan pelanggan kami melalui fitur 'Butuh Bantuan?' di aplikasi. Tim kami siap membantu Anda dengan pertanyaan atau masalah yang Anda hadapi.

Apakah ada batasan jumlah konsultasi dengan dokter?
Jawaban: Tidak ada batasan jumlah konsultasi selama Anda berlangganan paket unlimited. Anda dapat berkonsultasi dengan dokter sebanyak yang Anda butuhkan.

Apakah data pribadi saya aman?
Jawaban: Kami sangat menjaga privasi dan keamanan data pribadi Anda. Semua informasi yang Anda berikan akan disimpan dengan aman dan hanya digunakan untuk keperluan layanan yang Anda minta.

Bagaimana cara memperbarui informasi pribadi saya?
Jawaban: Anda dapat memperbarui informasi pribadi Anda melalui pengaturan akun di aplikasi. Buka menu pengaturan, pilih 'Edit Profil', dan lakukan perubahan yang diperlukan.

Bagaimana cara membatalkan langganan saya?
Jawaban: Anda dapat membatalkan langganan Anda kapan saja melalui pengaturan akun di aplikasi. Pilih 'Kelola Langganan' dan ikuti petunjuk untuk membatalkan langganan Anda. Harap diingat bahwa setelah pembatalan, Anda tidak akan mendapatkan pengembalian dana untuk periode yang sudah dibayar.

Apakah saya bisa mendapatkan pengembalian dana jika saya tidak puas dengan layanan?
Jawaban: Kami tidak menawarkan pengembalian dana untuk langganan yang sudah dibayar. Namun, jika Anda mengalami masalah dengan layanan kami, silakan hubungi layanan pelanggan dan kami akan berusaha membantu Anda dengan solusi terbaik.
    ''',
  },
];
