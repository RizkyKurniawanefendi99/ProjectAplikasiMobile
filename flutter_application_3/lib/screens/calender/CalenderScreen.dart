import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/calender/AppointmentScreen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<Map<String, String>> doctors = [
    {
      'name': 'dr. Iqbal Hikam Maulana, Sp.PD',
      'specialty': 'Doctor Penyakit Dalam',
      'hospital': 'Siloam Hospitals Jember',
      'distance': '32.86 km dari Anda',
      'fee': 'Rp145.000',
      'rating': '100%',
      'reviewCount': '20',
      'nextSchedule': 'Besok, 17.15 Siang'
    },
    {
      'name': 'dr. Adin Nugraha, Sp.PD.M',
      'specialty': 'Doctor Mata',
      'hospital': 'RS Citra Husada Jember, Patrang',
      'distance': '32.54 km dari Anda',
      'fee': 'Rp155.000',
      'rating': '100%',
      'reviewCount': '20',
      'nextSchedule': 'Besok, 14.15 Siang'
    },
    {
      'name': 'dr. Dedi Setiawan, Sp.OG',
      'specialty': 'Doctor Kandungan',
      'hospital': 'RS Bina Sehat Jember',
      'distance': '30.12 km dari Anda',
      'fee': 'Rp165.000',
      'rating': '98%',
      'reviewCount': '18',
      'nextSchedule': 'Besok, 09.00 Pagi'
    },
    {
      'name': 'dr. Siti Nurhaliza, Sp.A',
      'specialty': 'Doctor Anak',
      'hospital': 'RS Baladhika Husada Jember',
      'distance': '35.00 km dari Anda',
      'fee': 'Rp150.000',
      'rating': '99%',
      'reviewCount': '25',
      'nextSchedule': 'Lusa, 10.00 Pagi'
    },
    {
      'name': 'dr. Andi Pratama, Sp.THT',
      'specialty': 'Doctor THT',
      'hospital': 'RS Paru Jember',
      'distance': '28.50 km dari Anda',
      'fee': 'Rp140.000',
      'rating': '97%',
      'reviewCount': '15',
      'nextSchedule': 'Besok, 11.30 Siang'
    }
  ];

  List<Map<String, String>> filteredDoctors = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredDoctors = doctors;
  }

  void filterDoctors(String query) {
    List<Map<String, String>> results = [];
    if (query.isEmpty) {
      results = doctors;
    } else {
      results = doctors
          .where((doctor) =>
              doctor['name']!.toLowerCase().contains(query.toLowerCase()) ||
              doctor['specialty']!
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              doctor['hospital']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredDoctors = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REMEDIC'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.account_circle),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Buat Janji Konsultasi',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Proses singkat, Tanpa Antre',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Cari dokter, spesialisasi, lab test',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) {
                    filterDoctors(value);
                  },
                ),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilterButton(label: 'Semua', isSelected: true),
                    FilterButton(label: 'Kandungan', isSelected: false),
                    FilterButton(label: 'Anak', isSelected: false),
                    FilterButton(label: 'THT', isSelected: false),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDoctors.length,
              itemBuilder: (context, index) {
                return DoctorCard(
                  name: filteredDoctors[index]['name']!,
                  specialty: filteredDoctors[index]['specialty']!,
                  hospital: filteredDoctors[index]['hospital']!,
                  distance: filteredDoctors[index]['distance']!,
                  fee: filteredDoctors[index]['fee']!,
                  rating: filteredDoctors[index]['rating']!,
                  reviewCount:
                      int.parse(filteredDoctors[index]['reviewCount']!),
                  nextSchedule: filteredDoctors[index]['nextSchedule']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterButton({super.key, 
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.black,
        backgroundColor: isSelected ? Colors.blue : Colors.white,
      ),
      onPressed: () {
        // Handle filter button press
      },
      child: Text(label),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String hospital;
  final String distance;
  final String fee;
  final String rating;
  final int reviewCount;
  final String nextSchedule;

  const DoctorCard({super.key, 
    required this.name,
    required this.specialty,
    required this.hospital,
    required this.distance,
    required this.fee,
    required this.rating,
    required this.reviewCount,
    required this.nextSchedule,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/doctor_placeholder.png'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        specialty,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        hospital,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        distance,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Biaya Konsultasi: $fee',
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                  ),
                ),
                Flexible(
                  child: Text(
                    'Ulasan Dokter: $rating ($reviewCount ulasan)',
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Jadwal Berikutnya: $nextSchedule',
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AppointmentScreen()),
                );
                // Handle "Buat Janji" button press
              },
              child: const Text('Buat Janji'),
            ),
          ],
        ),
      ),
    );
  }
}
