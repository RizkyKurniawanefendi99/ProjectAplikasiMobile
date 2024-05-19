import 'package:flutter/material.dart';
import 'package:flutter_application_3/navbar/navbar.dart';

class HistoryScreen extends StatelessWidget {
  final String selectedDoctor;
  final DateTime selectedDay;
  final String selectedPaymentMethod;

  const HistoryScreen({super.key, 
    required this.selectedDoctor,
    required this.selectedDay,
    required this.selectedPaymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pemesanan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white, // Warna biru muda
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Informasi Booking:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text(
                    'Dokter:',
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(
                    selectedDoctor,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text(
                    'Tanggal Booking:',
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(
                    '${selectedDay.day}/${selectedDay.month}/${selectedDay.year}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.payment),
                  title: const Text(
                    'Metode Pembayaran:',
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(
                    selectedPaymentMethod,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Tambahkan tombol floating action
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const Navbar()), // Arahkan ke halaman DashboardScreen.dart
          );
        }, // Tambahkan ikon 'done'
        backgroundColor: Colors.blue,
        child: Icon(Icons.done), // Warna latar belakang
      ),
    );
  }
}
