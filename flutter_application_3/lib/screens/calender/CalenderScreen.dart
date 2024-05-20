import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Payment/PayScreen.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String? _selectedDoctor;
  String? _selectedPaymentMethod;

  int? get year => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Tanggal Booking'),
      ),
      body: Column(
        children: <Widget>[
          DropdownButton<String>(
            value: _selectedDoctor,
            hint: Text('Pilih Dokter'),
            onChanged: (String? newValue) {
              setState(() {
                _selectedDoctor = newValue;
              });
            },
            items: <String>['Dokter A', 'Dokter B', 'Dokter C']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          SizedBox(height: 20),
          DropdownButton<String>(
            value: _selectedPaymentMethod,
            hint: Text('Pilih Metode Pembayaran'),
            onChanged: (String? newValue) {
              setState(() {
                _selectedPaymentMethod = newValue;
              });
            },
            items: <String>['Metode Pembayaran A', 'Metode Pembayaran B']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _selectedDay != null &&
                    _selectedDoctor != null &&
                    _selectedPaymentMethod != null
                ? () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Konfirmasi Booking"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dokter: $_selectedDoctor"),
                            Text("Tanggal Booking: $_selectedDay"),
                            Text("Metode Pembayaran: $_selectedPaymentMethod"),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Batal'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              // Proses berhasil
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content:
                                      Text("Silahkan Lanjutkan Pembayaran"),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        // Navigasi ke halaman riwayat pemesanan
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PaymentMethodScreen()),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }
                : null,
            child: Text('Continue to Booking'),
          )
        ],
      ),
    );
  }
}
