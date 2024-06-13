import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_3/navbar/navbar.dart';

class ExpeditionScreen extends StatelessWidget {
  final String nomorResi;
  final DateTime tanggal;
  final String layanan;
  final String berat;
  final String status;
  final String harga;
  final List<TrackingHistory> riwayatPengiriman;

  const ExpeditionScreen({
    Key? key,
    required this.nomorResi,
    required this.tanggal,
    required this.layanan,
    required this.berat,
    required this.status,
    required this.harga,
    required this.riwayatPengiriman,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lacak Paket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
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
                      'Nomor Resi: $nomorResi',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Tanggal: ${DateFormat('dd MMM yyyy').format(tanggal)}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Layanan: $layanan',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Berat: $berat',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Status: $status',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Harga: $harga',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Tracking History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: riwayatPengiriman.length,
                itemBuilder: (context, index) {
                  final item = riwayatPengiriman[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.check_circle, color: Colors.green),
                      title: Text(item.status, style: TextStyle(fontSize: 16)),
                      subtitle: Text(
                        '${item.lokasi}\n${DateFormat('dd MMM yyyy, HH:mm').format(item.tanggal)}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Navbar()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text('Selesai'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrackingHistory {
  final String status;
  final String lokasi;
  final DateTime tanggal;

  TrackingHistory({
    required this.status,
    required this.lokasi,
    required this.tanggal,
  });
}
