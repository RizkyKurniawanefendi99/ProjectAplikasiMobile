import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/screens/member/bayarmember.dart';

class PersonalInfoForm extends StatefulWidget {
  @override
  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  String _gender = 'Laki-Laki';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  String _countryCode = '+62'; // Default country code for Indonesia

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        _birthDateController.text = "${picked.toLocal()}".split(' ')[0]; // Format the date as YYYY-MM-DD
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isi Data Diri'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
           Navigator.pop(context); // Implement back button functionality
          },
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.orange,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text('1', style: TextStyle(color: Colors.black)),
                  Text(' — Isi Data Diri', style: TextStyle(color: Colors.black)),
                  SizedBox(width: 10),
                  Text('—', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.grey[300],
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text('2', style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Diri Anda',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Nama Lengkap (Sesuai KTP/KITAS)',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Harap isi nama lengkap';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _birthDateController,
                        decoration: InputDecoration(
                          labelText: 'Tanggal Lahir',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () => _selectDate(context),
                          ),
                        ),
                        readOnly: true,
                      ),
                      SizedBox(height: 16),
                      Text('Jenis Kelamin'),
                      Row(
                        children: [
                          ChoiceChip(
                            label: Text('Laki-Laki'),
                            selected: _gender == 'Laki-Laki',
                            onSelected: (bool selected) {
                              setState(() {
                                _gender = 'Laki-Laki';
                              });
                            },
                          ),
                          SizedBox(width: 8),
                          ChoiceChip(
                            label: Text('Perempuan'),
                            selected: _gender == 'Perempuan',
                            onSelected: (bool selected) {
                              setState(() {
                                _gender = 'Perempuan';
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          DropdownButton<String>(
                            value: _countryCode,
                            items: <String>['+62', '+1', '+44', '+91']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _countryCode = newValue!;
                              });
                            },
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                labelText: 'Nomor Ponsel',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Harap isi nomor ponsel';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Alamat Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Harap isi alamat email';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentPage(),
                        ),
                      );
                    }
                  },
                  child: Text('Lanjutkan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
