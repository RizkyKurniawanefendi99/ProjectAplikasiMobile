import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/calender/DataPatientScreen.dart';

class DocumentPatient extends StatelessWidget {
  final String bookingDate;
  final String bookingTime;

  const DocumentPatient({super.key, required this.bookingDate, required this.bookingTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pemesan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCard(
              context,
              title: 'Dokter Pilihan Anda',
              content: _buildDoctorInfo(),
            ),
            const SizedBox(height: 16),
            _buildCard(
              context,
              title: 'Lokasi & Jadwal Praktik',
              content: _buildScheduleInfo(),
            ),
            const SizedBox(height: 16),
            _buildCard(
              context,
              title: 'Data Pemesan',
              content: _buildBookingInfo(),
            ),
            const Spacer(),
            Center(
              child: _buildNextButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required String title, required Widget content}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(title),
            const SizedBox(height: 8),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  Widget _buildDoctorInfo() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(
              'assets/images/doctor.png'), // Change to actual image asset
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('dr. Kukuh Wibisono, Sp.KFR'),
            Text(
              'Dokter Rehabilitasi Medis',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildScheduleInfo() {
    return Row(
      children: [
        Image.asset(
          'assets/images/rumahsakit1.jpg', // Change to actual image asset
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('RS Citra Husada Jember'),
              Text(bookingDate),
              Text(bookingTime),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBookingInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Informasi terkait buat janji ini akan dikirimkan ke nomor ponsel dan email di bawah ini.',
          style: TextStyle(color: Colors.grey[600]),
        ),
        const SizedBox(height: 8),
        const Text('Nomor Ponsel Anda'),
        const Text('089686013385'),
        const SizedBox(height: 8),
        const Text('Email Anda'),
        const Text('cadarislam99@gmail.com'),
        const SizedBox(height: 8),
        const Text('Nama Lengkap Anda'),
        const Text('rizky kurniawan efendi'),
      ],
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DataPatientScreen(
              bookingDate: bookingDate,
              bookingTime: bookingTime,
              consultationFee: 145000, // Provide a valid integer value
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      ),
      child: const Text('Lanjut ke Data Pasien'),
    );
  }
}

void main() => runApp(const MaterialApp(
      home: DocumentPatient(
          bookingDate: '07 Juni 2024', bookingTime: '15:00 - 18:00'),
    ));
