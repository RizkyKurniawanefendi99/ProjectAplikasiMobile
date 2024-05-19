import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data dummy untuk notifikasi kesehatan
    final List<Map<String, String>> notifications = [
      {
        "title": "Janji Temu Dokter",
        "content":
            "Anda memiliki janji temu dengan Dr. Siti besok jam 10:00 AM. Jangan lupa persiapkan pertanyaan Anda."
      },
      {
        "title": "Tips Kesehatan Harian",
        "content":
            "Minum lebih banyak air putih untuk menjaga hidrasi tubuh Anda, terutama di musim panas."
      },
      {
        "title": "Promo Bulan Ini",
        "content":
            "Dapatkan diskon 20% untuk pemeriksaan laboratorium selama bulan Mei. Daftar sekarang!"
      },
      {
        "title": "Pembaruan Aplikasi",
        "content":
            "Versi terbaru aplikasi sudah tersedia. Perbarui sekarang untuk pengalaman yang lebih baik."
      },
      {
        "title": "Pengingat Obat",
        "content":
            "Ini waktu untuk minum obat Anda: Paracetamol. Jangan lupa minum obat sesuai jadwal."
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          var notification = notifications[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.notifications,
                  color: Theme.of(context).primaryColor),
              title: Text(notification["title"]!),
              subtitle: Text(notification["content"]!),
              onTap: () {
                // Aksi ketika notifikasi diklik
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(notification["title"]!),
                      content: Text(notification["content"]!),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Tutup dialog
                          },
                          child: Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
