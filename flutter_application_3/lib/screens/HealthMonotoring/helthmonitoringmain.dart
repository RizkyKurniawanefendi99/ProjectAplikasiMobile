import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_application_3/screens/Record/NotificationScreen.dart';

class HealthMonitoringMain extends StatefulWidget {
  @override
  _HealthMonitoringMainState createState() => _HealthMonitoringMainState();
}

class _HealthMonitoringMainState extends State<HealthMonitoringMain> {
  // Contoh parameter dinamis
  String tekananDarah = '119/79 mmHg';
  String statusTekananDarah = 'Anda dalam kondisi baik!';
  int detakJantung = 105;
  int kalori = 760;
  int totalKalori = 800;
  int langkah = 6457;
  double suhu = 36.6;
  bool lariPagiSelesai = false;
  bool yogaSelesai = false;
  bool konsumsiSayuranSelesai = true;
  String waktuSekarang = '';

  @override
  void initState() {
    super.initState();
    // Simulasi pembaruan data waktu nyata setiap 30 detik
    Timer.periodic(Duration(seconds: 30), (timer) {
      perbaruiDataKesehatan();
      setState(() {
        waktuSekarang =
            "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
      });
    });
  }

  void perbaruiDataKesehatan() {
    setState(() {
      // Perbarui data kesehatan dengan nilai baru (contoh)
      tekananDarah = '120/80 mmHg';
      detakJantung = 110;
      kalori = 770;
      langkah = 6500;
      suhu = 36.7;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, Rizky K E'),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hari Ini, 18 Dec',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Waktu: $waktuSekarang',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tekanan Darah',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.favorite, color: Colors.red),
                      ],
                    ),
                    Text(
                      tekananDarah,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(statusTekananDarah),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildAnimatedHealthStatCard('Detak Jantung', '$detakJantung bpm',
                    'Normal', Icons.favorite, Colors.red),
                buildAnimatedHealthStatCard('Kalori', '$kalori Kcal',
                    '/ $totalKalori Kcal', Icons.local_fire_department, Colors.orange),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildAnimatedHealthStatCard('Total Langkah', '$langkah', 'Kerja Bagus',
                    Icons.directions_walk, Colors.green),
                buildAnimatedHealthStatCard('Suhu', '$suhu C', 'Terakhir Update',
                    Icons.thermostat, Colors.blue),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Aktivitas Anda',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            buildActivityCard('Lari Pagi', '20-30 menit', Icons.directions_run,
                lariPagiSelesai),
            buildActivityCard(
                'Yoga', '30 menit', Icons.self_improvement, yogaSelesai),
            buildActivityCard('Konsumsi Sayuran', '205.6 Kcal',
                Icons.local_dining, konsumsiSayuranSelesai),
          ],
        ),
      ),
    );
  }

  Widget buildAnimatedHealthStatCard(
      String title, String value, String subtitle, IconData icon, Color iconColor) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 30),
            SizedBox(height: 10),
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  value,
                  textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  colors: [
                    Colors.black,
                    iconColor,
                  ],
                ),
              ],
              isRepeatingAnimation: true,
              repeatForever: true,
            ),
            if (subtitle.isNotEmpty)
              Text(subtitle, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget buildActivityCard(
      String title, String duration, IconData icon, bool isCompleted) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black, size: 30),
        title: Text(title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        subtitle: Text(duration),
        trailing: isCompleted
            ? Icon(Icons.check_circle, color: Colors.green)
            : ElevatedButton(
                onPressed: () {
                  setState(() {
                    isCompleted = !isCompleted;
                  });
                },
                child: Text('To Do'),
              ),
      ),
    );
  }
}
