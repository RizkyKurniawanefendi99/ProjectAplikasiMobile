import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecordMedicDashboard(),
    );
  }
}

class RecordMedicDashboard extends StatefulWidget {
  @override
  _RecordMedicDashboardState createState() => _RecordMedicDashboardState();
}

class _RecordMedicDashboardState extends State<RecordMedicDashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildHeader(),
              SizedBox(height: 20),
              _buildSearch(),
              SizedBox(height: 20),
              _buildRoutineStatistics(),
              SizedBox(height: 20),
              _buildActivityGraph(),
              SizedBox(height: 20),
              _buildSectionTitle('Appointments'),
              SizedBox(height: 10),
              _buildAppointments(),
              SizedBox(height: 20),
              _buildSectionTitle('Test Results'),
              SizedBox(height: 10),
              _buildTestResults(),
              SizedBox(height: 20),
              _buildSectionTitle('Medical Record'),
              SizedBox(height: 10),
              _buildExpandableMedicalRecord(),
              SizedBox(height: 20),
              _buildBackButton(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Bob Rosmen',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://via.placeholder.com/150'), // Add the actual image URL
        ),
      ],
    );
  }

  Widget _buildSearch() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildRoutineStatistics() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Routinity Statistic',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildAnimatedStatisticItem(
                'Daily routinity', '15 activity completed', Colors.blue),
            _buildAnimatedStatisticItem(
                'Weekly routinity', '22 activity completed', Colors.green),
            _buildAnimatedStatisticItem(
                'Monthly routinity', '30 activity completed', Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedStatisticItem(
      String title, String subtitle, Color color) {
    return Column(
      children: [
        Row(
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return CircularProgressIndicator(
                  value: _animation.value,
                  color: color,
                );
              },
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(subtitle),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildActivityGraph() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'My Activity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.network(
                'https://via.placeholder.com/150'), // Replace with actual graph image or graph widget
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: Text('See all'),
        ),
      ],
    );
  }

  Widget _buildAppointments() {
    return Column(
      children: [
        _buildAppointmentCard(
            'Dr. Alex Jones', 'Cardiologist', 'Oct 12 / 5:00 PM'),
        SizedBox(height: 10),
        _buildAppointmentCard(
            'Dr. David Tennant', 'Therapist', 'Dec 9 / 8:00 AM'),
      ],
    );
  }

  Widget _buildAppointmentCard(
      String doctorName, String specialization, String dateTime) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://via.placeholder.com/150'), // Add the actual image URL
        ),
        title: Text(doctorName),
        subtitle: Text(specialization),
        trailing: Text(dateTime),
      ),
    );
  }

  Widget _buildTestResults() {
    return Column(
      children: [
        _buildTestResultCard('Magnetic Resonance Imaging', 'MRI'),
      ],
    );
  }

  Widget _buildTestResultCard(String testName, String testType) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(Icons.description),
        title: Text(testName),
        subtitle: Text(testType),
      ),
    );
  }

  Widget _buildExpandableMedicalRecord() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        title: Text(
          'Rekam Medis Pasien',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        children: [
          _buildMedicalRecordItem(Icons.person, 'Identitas Pasien',
              'Nama: John Doe\nUsia: 30 tahun\nJenis Kelamin: Laki-laki'),
          _buildMedicalRecordItem(Icons.calendar_today,
              'Tanggal dan Waktu Tindakan', '10 Juni 2024, 10:00 AM'),
          _buildMedicalRecordItem(Icons.list_alt, 'Hasil Anamnesis',
              'Pasien mengeluh sakit kepala dan demam sejak 3 hari yang lalu.'),
          _buildMedicalRecordItem(Icons.healing, 'Keluhan dan Riwayat Penyakit',
              'Tidak ada riwayat penyakit serius sebelumnya.'),
          _buildMedicalRecordItem(
              Icons.medical_services,
              'Hasil Pemeriksaan Fisik dan Penunjang Medik',
              'Suhu: 38°C, Tekanan Darah: 120/80 mmHg, Nadi: 80 bpm'),
          _buildMedicalRecordItem(
              Icons.assignment, 'Diagnosis', 'Demam Berdarah'),
          _buildMedicalRecordItem(Icons.edit, 'Rencana Penatalaksanaan',
              'Pasien disarankan untuk istirahat dan minum banyak cairan.'),
          _buildMedicalRecordItem(
              Icons.local_hospital,
              'Pengobatan atau Tindakan Lain yang Telah Diberikan',
              'Parasetamol 500mg 3x sehari, Observasi lebih lanjut di rumah sakit.'),
          _buildMedicalRecordItem(
              Icons.description,
              'Dokumen Pendukung Lainnya',
              'Hasil laboratorium menunjukkan trombosit rendah.'),
        ],
      ),
    );
  }

  Widget _buildMedicalRecordItem(IconData icon, String title, String content) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.blue,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(content, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        
      },
      child: Text('Back to Home'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.folder),
          label: 'Records',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
