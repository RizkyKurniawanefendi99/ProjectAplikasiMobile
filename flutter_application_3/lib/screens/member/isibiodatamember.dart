import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PersonalInfoForm(),
    );
  }
}

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key});

  @override
  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  String _gender = 'Laki-Laki';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isi Data Diri'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Implement back button functionality
          },
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.orange,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 5),
                const Text('1', style: TextStyle(color: Colors.black)),
                const Text(' — Isi Data Diri', style: TextStyle(color: Colors.black)),
                const SizedBox(width: 10),
                const Text('—', style: TextStyle(color: Colors.grey)),
                const SizedBox(width: 10),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.grey[300],
                  child: const CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 5),
                const Text('2', style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Data Diri Anda',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Nama Lengkap (Sesuai KTP/KITAS)',
                      ),
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Tanggal Lahir',
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('Jenis Kelamin'),
                    Row(
                      children: [
                        ChoiceChip(
                          label: const Text('Laki-Laki'),
                          selected: _gender == 'Laki-Laki',
                          onSelected: (bool selected) {
                            setState(() {
                              _gender = 'Laki-Laki';
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('Perempuan'),
                          selected: _gender == 'Perempuan',
                          onSelected: (bool selected) {
                            setState(() {
                              _gender = 'Perempuan';
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Nomor Ponsel',
                      ),
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Alamat Email',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement next button functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                ),
                child: const Text('Lanjutkan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
