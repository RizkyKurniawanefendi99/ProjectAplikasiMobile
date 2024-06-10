import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/recordmedic/RecordMedicDashboard.dart';

class RecordMedic extends StatelessWidget {
  const RecordMedic({super.key});

  @override
  Widget build(BuildContext context) {
    // Misalnya, kita mendefinisikan height dan weight di sini.
// atau ambil dari sumber data
// atau ambil dari sumber data

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Saatnya Menikmati Kemudahan\nAkses Data Kesehatan',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 32),
            buildDescriptionItem(
              'assets/icon1.png', // Sesuaikan path gambar
              'Dapatkan riwayat kesehatan lengkap, akurat, dan dijamin keamanannya',
            ),
            buildDescriptionItem(
              'assets/icon2.png', // Sesuaikan path gambar
              'Pelayanan makin optimal karena riwayat kesehatan pasien tersedia setiap saat',
            ),
            buildDescriptionItem(
              'assets/icon3.png', // Sesuaikan path gambar
              'Pantau riwayat kesehatan dari waktu ke waktu untuk mencegah potensi penyakit kronis',
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RecordMedicDashboard(),
                    ),
                  );
                  // Tambahkan navigasi atau aksi disini
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text('Selanjutnya'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDescriptionItem(String iconPath, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(iconPath),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
