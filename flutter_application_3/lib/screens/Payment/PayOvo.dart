// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Payment/PaymentSuccess.dart';
import 'dart:async';

class PayOvo extends StatefulWidget {
  final String doctorName;
  final String doctorSpecialty;
  final int consultationFee;
  final String imagePath;

  const PayOvo({
    Key? key,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.consultationFee,
    required this.imagePath,
  }) : super(key: key);

  @override
  _PayOvoState createState() => _PayOvoState();
}

class _PayOvoState extends State<PayOvo> {
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaySuccess(
          referenceNumber: '000085752257',
          dateTime: DateTime.now(),
          paymentMethod: 'Ovo Virtual Account',
          amount: widget.consultationFee.toDouble(),
          senderName: 'Rizky Kurniawan Efendi',
          productName: '',
          choice: '',
        ),
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
            PaymentDetails(
              doctorName: widget.doctorName,
              doctorSpecialty: widget.doctorSpecialty,
              consultationFee: widget.consultationFee,
              imagePath: widget.imagePath,
            ),
            SizedBox(height: 16),
            Expanded(child: PaymentInstructions()),
            Center(
              child: ElevatedButton(
                onPressed: onPaymentCompleted,
                child: Text(
                  'Selesai Dibayar',
                ),
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

  const PaymentTimer({Key? key, required this.timeLeft, required this.deadline})
      : super(key: key);

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
  final String doctorName;
  final String doctorSpecialty;
  final int consultationFee;
  final String imagePath;

  const PaymentDetails({
    Key? key,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.consultationFee,
    required this.imagePath,
  }) : super(key: key);

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
                  'assets/images/ovo.png', // Update with Ovo logo
                  width: 40,
                  height: 40,
                ),
                SizedBox(width: 8),
                Text('Ovo', style: TextStyle(fontSize: 16)),
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
              'Rp${consultationFee.toString()}', // Example amount
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
            Divider(),
            Text(
              'Detail Dokter',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(imagePath),
                  radius: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doctorName,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(doctorSpecialty),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentInstructions extends StatelessWidget {
  const PaymentInstructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ExpansionTile(
          title: Text('Panduan Pembayaran'),
          children: [
            ListTile(
              title: Text('Internet Banking'),
              subtitle: Text(
                '1. Buka halaman internet banking Ovo (https://ovo.co.id)\n'
                '2. Lakukan login dan masukkan user ID dan password Anda\n'
                '3. Pilih “Transfer” > Pilih “Transfer ke Ovo Virtual Account”\n'
                '4. Masukkan nomor virtual account\n'
                '5. Pastikan detail pembayaran seperti Nomor Virtual Account, Nama Perusahaan, Nama Pembeli, dan Total Bayar sudah sesuai\n'
                '6. Masukkan password dan m-Token\n'
                '7. Pembayaran selesai. Simpan notifikasi sebagai bukti bayar',
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Mobile Banking Ovo'),
          children: [
            ListTile(
              title: Text('Panduan Mobile Banking Ovo'),
              subtitle: Text(
                '1. Buka aplikasi Mobile Ovo\n'
                '2. Lakukan login dengan user ID dan PIN\n'
                '3. Pilih “m-Transfer” > “Transfer ke Ovo Virtual Account”\n'
                '4. Masukkan nomor virtual account\n'
                '5. Periksa kembali detail pembayaran\n'
                '6. Masukkan PIN Ovo\n'
                '7. Pembayaran selesai dan simpan bukti pembayaran',
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('ATM Ovo'),
          children: [
            ListTile(
              title: Text('Panduan ATM Ovo'),
              subtitle: Text(
                '1. Masukkan kartu ATM dan PIN Anda\n'
                '2. Pilih “Transaksi Lain” > “Transfer” > “Ke Rek. Ovo Virtual Account”\n'
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
