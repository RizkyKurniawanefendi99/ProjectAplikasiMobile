import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekam Medis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showInputDialog(context);
          },
          child: Text('Masuk ke Rekam Medis'),
        ),
      ),
    );
  }

  void _showInputDialog(BuildContext context) {
    final heightController = TextEditingController();
    final weightController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Isi Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: heightController,
                decoration: InputDecoration(
                  labelText: 'Tinggi Badan (cm)',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: weightController,
                decoration: InputDecoration(
                  labelText: 'Berat Badan (kg)',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                final height = double.tryParse(heightController.text) ?? 0;
                final weight = double.tryParse(weightController.text) ?? 0;
                if (height > 0 && weight > 0) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RecordMedicDashboard(
                      height: height,
                      weight: weight,
                    ),
                  ));
                } else {
                  // Show error
                }
              },
              child: Text('Masuk'),
            ),
          ],
        );
      },
    );
  }
}

class RecordMedicDashboard extends StatefulWidget {
  final double height;
  final double weight;

  RecordMedicDashboard({required this.height, required this.weight});

  @override
  _RecordMedicDashboardState createState() => _RecordMedicDashboardState();
}

class _RecordMedicDashboardState extends State<RecordMedicDashboard> {
  late double height;
  late double weight;

  @override
  void initState() {
    super.initState();
    height = widget.height;
    weight = widget.weight;
  }

  @override
  Widget build(BuildContext context) {
    double bmi = weight / ((height / 100) * (height / 100));

    return Scaffold(
      appBar: AppBar(
        title: Text('Rekam Medis'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Ubah Profil',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Rizky Kurniawan Efendi',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('Laki-laki, 42 Tahun 6 Bulan'),
                  Text('Pasuruan'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text('Informasi Kesehatan Pasien'),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Tinggi Badan (cm)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        height = double.tryParse(value) ?? widget.height;
                      });
                    },
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Berat Badan (kg)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        weight = double.tryParse(value) ?? widget.weight;
                      });
                    },
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('BMI'),
                      Text(bmi.toStringAsFixed(1)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Divider(),
                  SizedBox(height: 8),
                  Text('Alergi Makanan'),
                  SizedBox(height: 4),
                  Text('Belum ada data. Isi Data',
                      style: TextStyle(color: Colors.blue)),
                  SizedBox(height: 8),
                  Text('Alergi Obat'),
                  SizedBox(height: 4),
                  Text('Belum ada data. Isi Data',
                      style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Kondisi Kesehatan Pasien',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  IconCard(icon: Icons.smoking_rooms, label: 'Merokok'),
                  IconCard(icon: Icons.favorite, label: 'Hipertensi'),
                  IconCard(icon: Icons.opacity, label: 'Diabetes'),
                  IconCard(icon: Icons.fastfood, label: 'Kolesterol'),
                  IconCard(icon: Icons.air, label: 'Asma'),
                  IconCard(icon: Icons.heart_broken, label: 'Jantung Koroner'),
                  IconCard(icon: Icons.coronavirus, label: 'TBC'),
                  IconCard(icon: Icons.child_care, label: 'Kesuburan'),
                  IconCard(icon: Icons.sick, label: 'Gagal Jantung'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  final IconData icon;
  final String label;

  IconCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.white),
          SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
