import 'package:flutter/material.dart';

class HealthMonitoringMain extends StatelessWidget {
  final Map<String, dynamic> healthStats = {
    'Tekanan Darah': {
      'value': '119/79 mmHg',
      'status': 'Anda dalam kondisi baik!',
      'icon': Icons.favorite,
      'color': Colors.red
    },
    'Detak Jantung': {
      'value': '105 bpm',
      'status': 'Normal',
      'icon': Icons.favorite,
      'color': Colors.red
    },
    'Kalori': {
      'value': '760 Kcal',
      'status': '/ 800 Kcal',
      'icon': Icons.local_fire_department,
      'color': Colors.orange
    },
    'Total Langkah': {
      'value': '6457',
      'status': 'Kerja Bagus',
      'icon': Icons.directions_walk,
      'color': Colors.blue
    },
    'Suhu': {
      'value': '36.6 C',
      'status': 'Terakhir Update',
      'icon': Icons.thermostat,
      'color': Colors.purple
    },
  };

  final List<Map<String, dynamic>> activities = [
    {
      'title': 'Lari Pagi',
      'duration': '20-30 menit',
      'icon': Icons.directions_run,
      'isCompleted': false
    },
    {
      'title': 'Yoga',
      'duration': '30 menit',
      'icon': Icons.self_improvement,
      'isCompleted': false
    },
    {
      'title': 'Konsumsi Sayuran',
      'duration': '205.6 Kcal',
      'icon': Icons.local_dining,
      'isCompleted': true
    },
  ];

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
              'Hari Ini, 18 Des',
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
                        Icon(healthStats['Tekanan Darah']['icon'],
                            color: healthStats['Tekanan Darah']['color']),
                      ],
                    ),
                    Text(
                      healthStats['Tekanan Darah']['value'],
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(healthStats['Tekanan Darah']['status']),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: healthStats.entries
                  .where((entry) => entry.key != 'Tekanan Darah')
                  .map((entry) => buildHealthStatCard(
                        entry.key,
                        entry.value['value'],
                        entry.value['status'],
                        entry.value['icon'],
                        entry.value['color'],
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Aktivitas Anda',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...activities.map((activity) => buildActivityCard(
                  activity['title'],
                  activity['duration'],
                  activity['icon'],
                  activity['isCompleted'],
                )),
          ],
        ),
      ),
    );
  }

  Widget buildHealthStatCard(
      String title, String value, String subtitle, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, color: color, size: 30),
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
