import 'package:flutter/material.dart';

class HealthMonitoringMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, Fikri'),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
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
                      '119/79 mmHg',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text('Anda dalam kondisi baik!'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildHealthStatCard(
                    'Detak Jantung', '105 bpm', 'Normal', Icons.favorite),
                buildHealthStatCard('Kalori', '760 Kcal', '/ 800 Kcal',
                    Icons.local_fire_department),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildHealthStatCard('Total Langkah', '6457', 'Kerja Bagus',
                    Icons.directions_walk),
                buildHealthStatCard(
                    'Suhu', '36.6 C', 'Terakhir Update', Icons.thermostat),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Aktivitas Anda',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            buildActivityCard(
                'Lari Pagi', '20-30 menit', Icons.directions_run, false),
            buildActivityCard(
                'Yoga', '30 menit', Icons.self_improvement, false),
            buildActivityCard(
                'Konsumsi Sayuran', '205.6 Kcal', Icons.local_dining, true),
          ],
        ),
      ),
    );
  }

  Widget buildHealthStatCard(
      String title, String value, String subtitle, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, color: Colors.black, size: 30),
            SizedBox(height: 10),
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(value,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                onPressed: () {},
                child: Text('To Do'),
              ),
      ),
    );
  }
}
