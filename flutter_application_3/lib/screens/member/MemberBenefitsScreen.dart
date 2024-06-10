import 'package:flutter/material.dart';

class MemberBenefitsScreen extends StatelessWidget {
  const MemberBenefitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Kembali ke halaman sebelumnya
            Navigator.pop(context);
          },
        ),
        title: const Text('REPROTEKSI'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Paket Unlimited Chat Dokter Spesialis Paling Terjangkau',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MemberBenefitsScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                          ),
                          child: const Text(
                            'Chat Dokter',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Pilihan Dokter Terlengkap',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  for (var doctor in _doctors)
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(doctor['imageUrl']!),
                        ),
                        title: Text(doctor['name']!),
                        subtitle: Text(doctor['specialty']!),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Keuntungan Lainnya',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Column(
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
              const SizedBox(height: 20),
              const Text(
                'Informasi Lainnya',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  for (var info in _infoList)
                    Card(
                      child: ListTile(
                        title: Text(info['title']!),
                        subtitle: Text(info['description']!),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[100],
                ),
                child: const Text(
                  'Butuh Bantuan?',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '35.000/bulan',
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
                          builder: (context) => const MemberBenefitsScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text('Daftar Sekarang'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
    'title': 'Syarat Keikutsertaan',
    'description': 'Deskripsi Syarat Keikutsertaan',
  },
  {
    'title': 'Cara Pembayaran',
    'description': 'Deskripsi Cara Pembayaran',
  },
  {
    'title': 'Syarat & Ketentuan',
    'description': 'Deskripsi Syarat & Ketentuan',
  },
  {
    'title': 'Pertanyaan yang Sering Ditanyakan',
    'description': 'Deskripsi FAQ',
  },
  // Tambahkan informasi lainnya di sini
];
