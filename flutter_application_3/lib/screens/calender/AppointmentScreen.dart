import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/calender/DocumentPatien.dart';
import 'package:intl/intl.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String _selectedSchedule = '';
  String _selectedDate = '';

  void _selectSchedule(String schedule) {
    setState(() {
      _selectedSchedule = schedule;
    });
  }

  void _selectDate(String date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime tomorrow = now.add(const Duration(days: 1));
    DateTime dayAfterTomorrow = now.add(const Duration(days: 2));

    String formattedTomorrow = DateFormat('EEEE, d MMMM y').format(tomorrow);
    String formattedDayAfterTomorrow =
        DateFormat('EEEE, d MMMM y').format(dayAfterTomorrow);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Dokter'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'dr. Iqbal Hikam Maulana, Sp.PD',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Dokter Penyakit Dalam',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '188 pasien telah buat janji dengan dokter ini',
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
                  const Text(
                    '100% 20 pasien >',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle review button press
                    },
                    child: const Text(
                      '+Berikan Ulasan',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Lokasi & Jadwal Praktik Terdekat',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/rumahsakit1.jpg',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Siloam Hospitals Jember',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Jl. Gajah Mada No.185, Jember Kidul, Kaliwates',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Biaya Konsultasi Rp145.000',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 14,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ScheduleCard(
                            date: formattedTomorrow,
                            schedules: const [
                              '08:00 - 08:35',
                              '09:00 - 09:35',
                              '10:00 - 10:35'
                            ],
                            selectedSchedule: _selectedSchedule,
                            onScheduleSelected: _selectSchedule,
                            onDateSelected: _selectDate,
                          ),
                          ScheduleCard(
                            date: formattedDayAfterTomorrow,
                            schedules: const ['18:00 - 18:35', '19:00 - 19:35'],
                            selectedSchedule: _selectedSchedule,
                            onScheduleSelected: _selectSchedule,
                            onDateSelected: _selectDate,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          // Handle view all locations and schedules
                        },
                        child: const Text(
                          'Lihat Semua Lokasi & Jadwal >',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Profil Dokter',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'dr. Iqbal Hikam Maulana, Sp.PD merupakan seorang Dokter Spesialis Penyakit Dalam',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle read more button press
                        },
                        child: const Text(
                          'Selengkapnya >',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DocumentPatient(
                        bookingDate: _selectedDate,
                        bookingTime: _selectedSchedule,
                      ), // Navigate to DocumentPatient page
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  textStyle: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Buat Janji Konsultasi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String date;
  final List<String> schedules;
  final String selectedSchedule;
  final ValueChanged<String> onScheduleSelected;
  final ValueChanged<String> onDateSelected;

  const ScheduleCard({super.key, 
    required this.date,
    required this.schedules,
    required this.selectedSchedule,
    required this.onScheduleSelected,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Paling Dicari - Slot dokter ini segera habis',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 8,
            children: schedules
                .map((schedule) => OutlinedButton(
                      onPressed: () {
                        onScheduleSelected(schedule);
                        onDateSelected(date);
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: selectedSchedule == schedule
                              ? Colors.orange
                              : Colors.grey,
                        ),
                      ),
                      child: Text(
                        schedule,
                        style: TextStyle(
                          color: selectedSchedule == schedule
                              ? Colors.orange
                              : Colors.black,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
