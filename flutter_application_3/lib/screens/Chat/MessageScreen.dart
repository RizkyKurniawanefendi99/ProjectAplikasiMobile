import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Payment/PayScreenBooking.dart';

class MessageScreen extends StatefulWidget {
  final String? doctorName;
  final String? doctorSpecialty;
  final double? doctorRating;

  const MessageScreen(
      {Key? key, this.doctorName, this.doctorSpecialty, this.doctorRating})
      : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<Map<String, dynamic>> doctors = [
    {
      'name': 'Chat Dokter Umum',
      'specialty': '',
      'price': 17500,
      'oldPrice': null,
      'isOnline': true,
      'satisfaction': 92,
      'reviews': 686,
      'imagePath': 'assets/images/dokter_umum.jpg',
    },
    {
      'name': 'dr. Suryanto Plokoto, Sp.PD',
      'specialty': 'Doctor Kandungan',
      'price': 45000,
      'oldPrice': 60000,
      'isOnline': true,
      'satisfaction': 88,
      'reviews': 1768,
      'imagePath': 'assets/images/dr_suryanto.jpg',
    },
    {
      'name': 'dr. Mariadi Jaedi, Sp.PhD',
      'specialty': 'Doctor Gigi',
      'price': 45000,
      'oldPrice': 60000,
      'isOnline': true,
      'satisfaction': 89,
      'reviews': 1768,
      'imagePath': 'assets/images/dr_mariadi.jpg',
    },
    {
      'name': 'dr. Maemunah Dui, Sp.PD',
      'specialty': '',
      'price': 45000,
      'oldPrice': 60000,
      'isOnline': true,
      'satisfaction': 97,
      'reviews': 2913,
      'imagePath': 'assets/images/dr_maemunah.jpg',
    },
    {
      'name': 'dr. Dian Puspita, Sp.A',
      'specialty': 'Pediatrician',
      'price': 50000,
      'oldPrice': 70000,
      'isOnline': true,
      'satisfaction': 95,
      'reviews': 1000,
      'imagePath': 'assets/images/dr_dian.jpg',
    },
    {
      'name': 'dr. Riza Pratama, Sp.OG',
      'specialty': 'Obstetrician',
      'price': 55000,
      'oldPrice': 75000,
      'isOnline': true,
      'satisfaction': 90,
      'reviews': 850,
      'imagePath': 'assets/images/dr_riza.jpg',
    },
    {
      'name': 'dr. Ahmad Fauzi, Sp.P',
      'specialty': 'Pulmonologist',
      'price': 60000,
      'oldPrice': 80000,
      'isOnline': true,
      'satisfaction': 92,
      'reviews': 900,
      'imagePath': 'assets/images/dr_ahmad.jpg',
    },
    {
      'name': 'dr. Siti Khadijah, Sp.KK',
      'specialty': 'Dermatologist',
      'price': 48000,
      'oldPrice': 60000,
      'isOnline': true,
      'satisfaction': 93,
      'reviews': 1100,
      'imagePath': 'assets/images/dr_siti.jpg',
    },
    {
      'name': 'dr. Yusuf Hambali, Sp.U',
      'specialty': 'Urologist',
      'price': 52000,
      'oldPrice': 68000,
      'isOnline': true,
      'satisfaction': 89,
      'reviews': 780,
      'imagePath': 'assets/images/dr_yusuf.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    if (widget.doctorName != null) {
      doctors.add({
        'name': widget.doctorName,
        'specialty': widget.doctorSpecialty,
        'price': 50000,
        'oldPrice': null,
        'isOnline': true,
        'satisfaction': (widget.doctorRating! * 20).toInt(),
        'reviews': 0,
        'imagePath': 'assets/images/default_doctor.jpg',
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Bersama Dokter'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Cari dokter, spesialisasi, lab test',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                return DoctorCard(
                  name: doctors[index]['name'],
                  specialty: doctors[index]['specialty'],
                  price: doctors[index]['price'],
                  oldPrice: doctors[index]['oldPrice'],
                  isOnline: doctors[index]['isOnline'],
                  satisfaction: doctors[index]['satisfaction'],
                  reviews: doctors[index]['reviews'],
                  imagePath: doctors[index]['imagePath'],
                );
              },
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

  const DoctorCard({
    Key? key,
    required this.name,
    required this.specialty,
    required this.price,
    this.oldPrice,
    required this.isOnline,
    required this.satisfaction,
    required this.reviews,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 30,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  if (specialty.isNotEmpty)
                    Text(
                      specialty,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 20),
                      Text('$satisfaction%'),
                      const SizedBox(width: 5),
                      Text('($reviews ulasan)'),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Rp. ${price.toString()}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      if (oldPrice != null) const SizedBox(width: 5),
                      if (oldPrice != null)
                        Text(
                          'Rp. ${oldPrice.toString()}',
                          style: const TextStyle(
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
                if (isOnline)
                  const Icon(Icons.circle, color: Colors.green, size: 14),
                const SizedBox(height: 5),
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
                  child: const Text('Mulai Chat'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
