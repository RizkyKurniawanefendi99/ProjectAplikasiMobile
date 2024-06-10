import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Payment/PayScreenBooking.dart';
import 'package:intl/intl.dart';

class DataPatientScreen extends StatefulWidget {
  final String bookingDate;
  final String bookingTime;
  final int consultationFee;

  const DataPatientScreen({super.key, 
    required this.bookingDate,
    required this.bookingTime,
    required this.consultationFee,
  });

  @override
  _DataPatientScreenState createState() => _DataPatientScreenState();
}

class _DataPatientScreenState extends State<DataPatientScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _ktpController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String _selectedGender = 'Laki-laki';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pasien'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lengkapi Data Pasien',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 8),
                const Text('Silakan lengkapi data pasien untuk buat janji:'),
                const SizedBox(height: 16),
                _buildTextFormField('Nama Sesuai KTP/SKTT', _nameController,
                    'Nama harus diisi'),
                const SizedBox(height: 16),
                _buildDateFormField(context, 'Tanggal Lahir Pasien',
                    _dobController, 'Tanggal lahir harus diisi'),
                const SizedBox(height: 16),
                const Text('Jenis Kelamin Pasien:', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                _buildGenderSelection(),
                const SizedBox(height: 16),
                _buildTextFormField('No KTP/NIK Pasien', _ktpController,
                    'No KTP/NIK harus diisi'),
                const SizedBox(height: 16),
                _buildTextFormField('Alamat sesuai KTP/SKTT Pasien',
                    _addressController, 'Alamat harus diisi'),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentBokingMethodScreen(
                              doctorName: 'dr. Kukuh Wibisono',
                              doctorSpecialty: 'Dokter Rehabilitasi Medis',
                              consultationFee: widget.consultationFee,
                              imagePath: 'assets/images/doctor.png',
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    ),
                    child: const Text('Lanjut ke Pembayaran'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, TextEditingController controller,
      String validationMessage) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        }
        return null;
      },
    );
  }

  Widget _buildDateFormField(BuildContext context, String label,
      TextEditingController controller, String validationMessage) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
          controller.text = formattedDate;
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            suffixIcon: const Icon(Icons.calendar_today),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validationMessage;
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedGender = 'Laki-laki';
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: _selectedGender == 'Laki-laki'
                    ? Colors.blue
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              child: Text(
                'Laki-laki',
                style: TextStyle(
                  color: _selectedGender == 'Laki-laki'
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedGender = 'Perempuan';
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: _selectedGender == 'Perempuan'
                    ? Colors.blue
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              child: Text(
                'Perempuan',
                style: TextStyle(
                  color: _selectedGender == 'Perempuan'
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
