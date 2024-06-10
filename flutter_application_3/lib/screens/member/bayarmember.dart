import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/member/pembayaransukses.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _paymentPeriod = 'Bulanan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
           Navigator.pop(context); // Implement back button functionality
          },
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.grey[300],
                  child: const CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 5),
                const Text('1', style: TextStyle(color: Colors.grey)),
                const Text(' — Isi Data Diri', style: TextStyle(color: Colors.grey)),
                const SizedBox(width: 10),
                const Text('—', style: TextStyle(color: Colors.black)),
                const SizedBox(width: 10),
                const CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.orange,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 5),
                const Text('2', style: TextStyle(color: Colors.black)),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Pilih kemudahan Transaksi Anda',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ChoiceChip(
                  label: const Text('Bayar Bulanan'),
                  selected: _paymentPeriod == 'Bulanan',
                  onSelected: (bool selected) {
                    setState(() {
                      _paymentPeriod = 'Bulanan';
                    });
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Bayar Tahunan'),
                  selected: _paymentPeriod == 'Tahunan',
                  onSelected: (bool selected) {
                    setState(() {
                      _paymentPeriod = 'Tahunan';
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rincian Pembayaran',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Durasi Berlangganan'),
                        Text('Setiap Bulan'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Biaya Berlangganan'),
                        Text('Rp35.000'),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total biaya berlangganan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rp35.000',
                          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kartu Debit/Kredit',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text('Kartu Debit/kredit'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• Anda akan diragih setiap bulan mulai dari tanggal 30 April 2024',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '• Batalkan Kapan Saja. Pelajari Syarat & Ketentuan nya',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '• Pelajari cara aktivasi kartu debit untuk melakukan pembayaran online di sini',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                 Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentSuccessScreen(),
                                ), 
                                );// Implement next button functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                ),
                child: const Text('Lanjutkan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
