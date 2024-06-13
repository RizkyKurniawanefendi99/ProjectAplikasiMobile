import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/member/MemberBenefitsScreen.dart';

class MemberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REMEDIC'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Cara Mendaftar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Stepper(
                physics: ClampingScrollPhysics(),
                controlsBuilder: (BuildContext context, ControlsDetails controls) {
                  return Container(); // Menghilangkan tombol continue dan cancel
                },
                steps: [
                  Step(
                    title: Text('Pilih Paket Asuransi'),
                    content: Container(), // Konten kosong untuk menghapus teks
                  ),
                  Step(
                    title: Text('Isi Detail Diri'),
                    content: Text('Isi Form Registrasi diri seperti nama, alamat, nomor telepon dan lainnya.'),
                  ),
                  Step(
                    title: Text('Lihat Metode Pembayaran'),
                    content: Container(),
                  ),
                  Step(
                    title: Text('Member Reprotektif Aktif!'),
                    content: Text('Anda berhasil menjadi member dan bisa manfaatkan semua kelebihannya. (Khusus Reproteksi dan Reproteksi Plus membutuhkan waktu 1 hari kerja)'),
                  ),
                ],
                currentStep: 0,
                onStepTapped: (step) {},
              ),
              SizedBox(height: 20),
              Text(
                'Paket Yang Tersedia',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'REPROTEKSI',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text('Unlimited free chat ke dokter spesialis 24 jam, dokter pribadi dan gratis ongkir dan obat'),
                      SizedBox(height: 10),
                      Text(
                        'Rp 35.000/bulan',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Lihat Detail'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MemberBenefitsScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.orange),
                            child: Text('Daftar'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
