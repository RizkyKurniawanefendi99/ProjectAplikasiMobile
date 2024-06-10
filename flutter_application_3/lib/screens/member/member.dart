import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/member/MemberBenefitsScreen.dart';


class MemberScreen extends StatelessWidget {
  const MemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REMEDIC'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Paket Yang Tersedia',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'REPROTEKSI',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text('Unlimited free chat ke dokter spesialis 24 jam, dokter pribadi dan gratis ongkir dan obat'),
                      const SizedBox(height: 10),
                      const Text(
                        'Rp 35.000/bulan',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Lihat Detail'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MemberBenefitsScreen()),);
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                            child: const Text('Daftar'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Cara Mendaftar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Stepper(
                physics: const ClampingScrollPhysics(),
                steps: [
                  const Step(
                    title: Text('Pilih Paket Asuransi'),
                    content: Text('Pilih Paket dan Periode Berlangganan sesuai Kebutuhan Anda.'),
                  ),
                  const Step(
                    title: Text('Isi Detail Diri'),
                    content: Text('Isi Form Registrasi diri seperti nama, alamat, nomor telepon dan lainnya.'),
                  ),
                  Step(
                    title: const Text('Lihat Metode Pembayaran'),
                    content: Container(),
                  ),
                  const Step(
                    title: Text('Member Reprotektif Aktif!'),
                    content: Text('Anda berhasil menjadi member dan bisa manfaatkan semua kelebihannya. (Khusus Reproteksti dan Reproteksi Plus membutuhkan waktu 1 hari kerja)'),
                  ),
                ],
                currentStep: 0,
                onStepTapped: (step) {},
                onStepContinue: () {},
                onStepCancel: () {},
              ),
              const SizedBox(height: 20),
              const Text(
                'Testimoni Dari',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                '10.000.000 Orang',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              const SizedBox(height: 10),
              const Text(
                'Sudah menjadi member Reproteksi',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              const Text(
                'Kata Mereka Tentang Reproteksi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage('https://via.placeholder.com/150'), // URL gambar placeholder
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nugraha', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text('Karyawan BUMN'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text('...'), // Teks testimoni
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Tentang Reproteksi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                child: const Text(
                  'Butuh Bantuan',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
