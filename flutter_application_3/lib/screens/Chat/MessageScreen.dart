import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Payment/PayScreenBooking.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Bersama Dokter'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari dokter, spesialisasi, lab test',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                DoctorCard(
                  name: 'Chat Dokter Umum',
                  specialty: '',
                  price: 17500,
                  oldPrice: null,
                  isOnline: true,
                  satisfaction: 92,
                  reviews: 686,
                  imagePath: 'assets/images/dokter_umum.jpg',
                ),
                DoctorCard(
                  name: 'dr. Suryanto Plokoto, Sp.PD',
                  specialty: 'Doctor Kandungan',
                  price: 45000,
                  oldPrice: 60000,
                  isOnline: true,
                  satisfaction: 88,
                  reviews: 1768,
                  imagePath: 'assets/images/dr_suryanto.jpg',
                ),
                DoctorCard(
                  name: 'dr. Mariadi Jaedi, Sp.PhD',
                  specialty: 'Doctor Gigi',
                  price: 45000,
                  oldPrice: 60000,
                  isOnline: true,
                  satisfaction: 89,
                  reviews: 1768,
                  imagePath: 'assets/images/dr_mariadi.jpg',
                ),
                DoctorCard(
                  name: 'dr. Maemunah Dui, Sp.PD',
                  specialty: '',
                  price: 45000,
                  oldPrice: 60000,
                  isOnline: true,
                  satisfaction: 97,
                  reviews: 2913,
                  imagePath: 'assets/images/dr_maemunah.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final int price;
  final int? oldPrice;
  final bool isOnline;
  final int satisfaction;
  final int reviews;
  final String imagePath;

  DoctorCard({
    required this.name,
    required this.specialty,
    required this.price,
    this.oldPrice,
    required this.isOnline,
    required this.satisfaction,
    required this.reviews,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 30,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  if (specialty.isNotEmpty)
                    Text(
                      specialty,
                      style: TextStyle(color: Colors.grey),
                    ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 20),
                      Text('$satisfaction%'),
                      SizedBox(width: 5),
                      Text('($reviews ulasan)'),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Rp. ${price.toString()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      if (oldPrice != null) SizedBox(width: 5),
                      if (oldPrice != null)
                        Text(
                          'Rp. ${oldPrice.toString()}',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                if (isOnline) Icon(Icons.circle, color: Colors.green, size: 14),
                SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentBokingMethodScreen(
                          doctorName: name,
                          doctorSpecialty: specialty,
                          consultationFee: price,
                          imagePath: imagePath,
                        ),
                      ),
                    );
                  },
                  child: Text('Mulai Chat'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
