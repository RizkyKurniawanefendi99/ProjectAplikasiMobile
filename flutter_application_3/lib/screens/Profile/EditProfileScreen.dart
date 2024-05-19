// ignore_for_file: unused_field, unused_import, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Profile/ProfileScreen.dart'; // Ganti dengan import yang sesuai

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  DateTime _birthdate = DateTime.now();
  String _address = '';
  String _selectedReligion = 'Islam'; // Default value for religion dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama Pengguna'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama pengguna tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  // You can add more complex validation here for email format
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tanggal Lahir:'),
                        SizedBox(height: 5),
                        Text(
                          '${_birthdate.day}/${_birthdate.month}/${_birthdate.year}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Alamat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _address = value!;
                },
              ),
              SizedBox(height: 10.0),
              DropdownButtonFormField<String>(
                value: _selectedReligion,
                decoration: InputDecoration(labelText: 'Agama'),
                items: <String>['Islam', 'Kristen', 'Katolik', 'Hindu', 'Buddha', 'Konghucu']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedReligion = value!;
                  });
                },
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Save the form data if validation passes
                        _formKey.currentState!.save();
                        // Now you can use _name, _email, _birthdate, _address, and _selectedReligion to save or send the data
                        _saveChanges(context);
                      }
                    },
                    child: Text('Simpan Perubahan'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveChanges(BuildContext context) {
    // Implementasi logika untuk menyimpan perubahan profil
    // Misalnya, kirim data ke backend atau simpan ke penyimpanan lokal
    // Anda dapat menggunakan _name, _email, _birthdate, _address, dan _selectedReligion di sini
    // ...

    // Contoh: Menampilkan snackbar sebagai konfirmasi
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data profil berhasil diperbarui!'),
      ),
    );

    // Navigasi kembali ke halaman profil setelah menyimpan perubahan
    Navigator.pop(context);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _birthdate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _birthdate)
      setState(() {
        _birthdate = picked;
      });
  }
}
