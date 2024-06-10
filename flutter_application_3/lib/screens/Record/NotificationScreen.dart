import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy untuk notifikasi kesehatan
    final List<Map<String, String>> notifications = [
      {
        "title": "Alarm Janji Temu",
        "content":
            "Janji temu Anda akan dimulai dalam 15 menit. Tetap di aplikasi.",
        "type": "alarm",
        "date": "Hari ini, 27 Feb 2022"
      },
      {
        "title": "Janji Temu Dikonfirmasi",
        "content":
            "Janji temu dengan Dr. Alisa Dewail dikonfirmasi. Panggilan akan diadakan pukul 10:00 AM 27 Feb",
        "type": "confirmed",
        "date": "Hari ini, 27 Feb 2022"
      },
      {
        "title": "Fitur Baru Tersedia",
        "content":
            "Sekarang Anda dapat dengan mudah menemukan dokter spesialis kami & membuat janji.",
        "type": "features",
        "date": "Hari ini, 27 Feb 2022"
      },
      {
        "title": "Alarm Janji Temu",
        "content":
            "Janji temu Anda akan dimulai dalam 15 menit. Tetap di aplikasi.",
        "type": "alarm",
        "date": "Hari ini, 14 Jan 2022"
      },
      {
        "title": "Janji Temu Dikonfirmasi",
        "content":
            "Janji temu dengan Dr. Alisa Dewail dikonfirmasi. Panggilan akan diadakan pukul 10:00 AM 14 Jan",
        "type": "confirmed",
        "date": "Hari ini, 14 Jan 2022"
      },
    ];

    IconData getIcon(String type) {
      switch (type) {
        case 'alarm':
          return Icons.alarm;
        case 'confirmed':
          return Icons.check_circle;
        case 'features':
          return Icons.new_releases;
        default:
          return Icons.notifications;
      }
    }

    Color getIconColor(String type) {
      switch (type) {
        case 'alarm':
          return Colors.pink;
        case 'confirmed':
          return Colors.blue;
        case 'features':
          return Colors.orange;
        default:
          return Colors.grey;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          var notification = notifications[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: Text(
                  notification["date"]!,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: getIconColor(notification["type"]!),
                    child: Icon(
                      getIcon(notification["type"]!),
                      color: Colors.white,
                    ),
                  ),
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
                              child: const Text('Tutup'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: NotificationScreen(),
  ));
}
