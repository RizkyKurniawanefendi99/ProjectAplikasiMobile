// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';

class PayShopee extends StatefulWidget {
  @override
  _PayShopeeState createState() => _PayShopeeState();
}

class _PayShopeeState extends State<PayShopee> {
  Duration duration = Duration(minutes: 20);
  Timer? timer;
  DateTime deadline = DateTime.now().add(Duration(minutes: 20));

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final seconds = duration.inSeconds - 1;
    if (seconds < 0) {
      timer?.cancel();
    } else {
      setState(() {
        duration = Duration(seconds: seconds);
      });
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  String formatDateTime(DateTime dateTime) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final year = dateTime.year;
    final month = twoDigits(dateTime.month);
    final day = twoDigits(dateTime.day);
    final hour = twoDigits(dateTime.hour);
    final minute = twoDigits(dateTime.minute);
    return '$day-$month-$year $hour:$minute';
  }

  void onPaymentCompleted() {
    // Handle payment completed action
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Pembayaran Selesai'),
        content: Text('Terima kasih, pembayaran Anda telah diterima.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Navigate back or to another page if needed
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selesaikan Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentTimer(
              timeLeft: formatDuration(duration),
              deadline: deadline,
            ),
            SizedBox(height: 16),
            PaymentDetails(),
            SizedBox(height: 16),
            Expanded(child: PaymentInstructions()),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: onPaymentCompleted,
                child: Text('Selesai Dibayar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentTimer extends StatelessWidget {
  final String timeLeft;
  final DateTime deadline;

  PaymentTimer({required this.timeLeft, required this.deadline});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Segera lakukan pembayaran dalam waktu',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                timeLeft,
                style: TextStyle(fontSize: 24, color: Colors.blue),
              ),
            ),
            Center(
              child: Text(
                'Sebelum ${formatDateTime(deadline)}',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDateTime(DateTime dateTime) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final day = twoDigits(dateTime.day);
    final month = twoDigits(dateTime.month);
    final year = dateTime.year;
    final hour = twoDigits(dateTime.hour);
    final minute = twoDigits(dateTime.minute);
    return '$day-$month-$year $hour:$minute';
  }
}

class PaymentDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transfer ke nomor Virtual Account',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Image.asset(
                    'assets/images/shopeepay.png', // Update with Shopee logo
                    width: 40,
                    height: 40),
                SizedBox(width: 8),
                Text('Shopee', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 8),
            Text(
              '12345-67890', // Example VA number
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                // Handle copy virtual account number
              },
              child: Text('Salin Nomor Virtual Account'),
            ),
            Divider(),
            Text(
              'Jumlah yang harus dibayar',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Rp200.000', // Example amount
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            TextButton(
              onPressed: () {
                // Handle copy amount
              },
              child: Text('Salin Jumlah'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentInstructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExpansionTile(
          title: Text('Panduan Pembayaran'),
          children: [
            ListTile(
              title: Text('Internet Banking'),
              subtitle: Text(
                '1. Buka halaman internet banking Shopee (https://shopee.co.id)\n'
                '2. Lakukan login dan masukkan user ID dan password Anda\n'
                '3. Pilih “Transfer” > Pilih “Transfer ke Shopee Virtual Account”\n'
                '4. Masukkan nomor virtual account\n'
                '5. Pastikan detail pembayaran seperti Nomor Virtual Account, Nama Perusahaan, Nama Pembeli, dan Total Bayar sudah sesuai\n'
                '6. Masukkan password dan m-Token\n'
                '7. Pembayaran selesai. Simpan notifikasi sebagai bukti bayar',
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Mobile Banking Shopee'),
          children: [
            ListTile(
              title: Text('Panduan Mobile Banking Shopee'),
              subtitle: Text(
                '1. Buka aplikasi Mobile Shopee\n'
                '2. Lakukan login dengan user ID dan PIN\n'
                '3. Pilih “m-Transfer” > “Transfer ke Shopee Virtual Account”\n'
                '4. Masukkan nomor virtual account\n'
                '5. Periksa kembali detail pembayaran\n'
                '6. Masukkan PIN Shopee\n'
                '7. Pembayaran selesai dan simpan bukti pembayaran',
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('ATM Shopee'),
          children: [
            ListTile(
              title: Text('Panduan ATM Shopee'),
              subtitle: Text(
                '1. Masukkan kartu ATM dan PIN Anda\n'
                '2. Pilih “Transaksi Lain” > “Transfer” > “Ke Rek. Shopee Virtual Account”\n'
                '3. Masukkan nomor virtual account\n'
                '4. Periksa kembali detail pembayaran\n'
                '5. Ikuti instruksi untuk menyelesaikan pembayaran\n'
                '6. Simpan struk sebagai bukti pembayaran',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
