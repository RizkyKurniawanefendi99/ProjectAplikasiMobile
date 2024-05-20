import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/recordmedic/RecordMedicDashboard.dart';

class RecordMedic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Misalnya, kita mendefinisikan height dan weight di sini.
    double height = 170.0; // atau ambil dari sumber data
    double weight = 70.0; // atau ambil dari sumber data

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Saatnya Menikmati Kemudahan\nAkses Data Kesehatan',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 32),
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
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RecordMedicDashboard(height: height, weight: weight),
                    ),
                  );
                  // Tambahkan navigasi atau aksi disini
                },
                child: Text('Selanjutnya'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
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
          SizedBox(width: 16),
          Expanded(
            child: Text(
              description,
              style: TextStyle(
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
