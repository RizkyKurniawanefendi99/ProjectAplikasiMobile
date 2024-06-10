import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_application_3/screens/calender/BookingSuccess.dart';

class PayBNI extends StatefulWidget {
  final String doctorName;
  final String doctorSpecialty;
  final int consultationFee;
  final String imagePath;

  const PayBNI({super.key, 
    required this.doctorName,
    required this.doctorSpecialty,
    required this.consultationFee,
    required this.imagePath,
  });

  @override
  _PayBNIState createState() => _PayBNIState();
}

class _PayBNIState extends State<PayBNI> {
  Duration duration = const Duration(hours: 1);
  Timer? timer;
  DateTime deadline = DateTime.now().add(const Duration(hours: 1));

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
    timer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
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
    // Navigate to BookingSuccess screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingSuccess(
          doctorName: widget.doctorName,
          doctorSpecialty: widget.doctorSpecialty,
          consultationFee: widget.consultationFee,
          imagePath: widget.imagePath,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selesaikan Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentTimer(
                timeLeft: formatDuration(duration), deadline: deadline),
            const SizedBox(height: 16),
            PaymentDetails(consultationFee: widget.consultationFee),
            const SizedBox(height: 16),
            const PaymentInstructions(),
            Center(
              child: ElevatedButton(
                onPressed: onPaymentCompleted,
                child: const Text(
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

  const PaymentTimer({super.key, required this.timeLeft, required this.deadline});

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
            const Text(
              'Segera lakukan pembayaran dalam waktu',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                timeLeft,
                style: const TextStyle(fontSize: 24, color: Colors.blue),
              ),
            ),
            Center(
              child: Text(
                'Sebelum ${formatDateTime(deadline)}',
                style: const TextStyle(color: Colors.grey),
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
  final int consultationFee;

  const PaymentDetails({super.key, required this.consultationFee});

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
            const Text(
              'Transfer ke nomor Virtual Account',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Image.asset('assets/images/bni.png',
                    width: 40, height: 40), // Update with BNI logo
                const SizedBox(width: 8),
                const Text('BNI', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              '39338-351541', // Example VA number
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                // Handle copy virtual account number
              },
              child: const Text('Salin Nomor Virtual Account'),
            ),
            const Divider(),
            const Text(
              'Jumlah yang harus dibayar',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Rp${consultationFee.toString()}', // Example amount
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            TextButton(
              onPressed: () {
                // Handle copy amount
              },
              child: const Text('Salin Jumlah'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentInstructions extends StatelessWidget {
  const PaymentInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          ExpansionTile(
            title: Text('Panduan Pembayaran'),
            children: [
              ListTile(
                title: Text('Internet Banking'),
                subtitle: Text(
                  '1. Buka halaman internet banking BNI (https://bni.co.id)\n'
                  '2. Lakukan login dan masukkan user ID dan password Anda\n'
                  '3. Pilih “Transfer Dana” > Pilih “Transfer ke BNI Virtual Account”\n'
                  '4. Masukkan nomor virtual account\n'
                  '5. Pastikan detail pembayaran seperti Nomor Virtual Account, Nama Perusahaan, Nama Pembeli, dan Total Bayar sudah sesuai\n'
                  '6. Masukkan password dan m-Token\n'
                  '7. Pembayaran selesai. Simpan notifikasi sebagai bukti bayar',
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Mobile BNI'),
            children: [
              ListTile(
                title: Text('Panduan Mobile BNI'),
                subtitle: Text(
                  '1. Buka aplikasi Mobile BNI\n'
                  '2. Lakukan login dengan user ID dan PIN\n'
                  '3. Pilih “m-Transfer” > “Transfer ke BNI Virtual Account”\n'
                  '4. Masukkan nomor virtual account\n'
                  '5. Periksa kembali detail pembayaran\n'
                  '6. Masukkan PIN BNI\n'
                  '7. Pembayaran selesai dan simpan bukti pembayaran',
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('ATM BNI'),
            children: [
              ListTile(
                title: Text('Panduan ATM BNI'),
                subtitle: Text(
                  '1. Masukkan kartu ATM dan PIN Anda\n'
                  '2. Pilih “Transaksi Lainnya” > “Transfer” > “Ke Rek. BNI Virtual Account”\n'
                  '3. Masukkan nomor virtual account\n'
                  '4. Periksa kembali detail pembayaran\n'
                  '5. Ikuti instruksi untuk menyelesaikan pembayaran\n'
                  '6. Simpan struk sebagai bukti pembayaran',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
