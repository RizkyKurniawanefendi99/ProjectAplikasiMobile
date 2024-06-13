import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Payment/PayBCA.dart';
import 'package:flutter_application_3/screens/Payment/PayBNI.dart';
import 'package:flutter_application_3/screens/Payment/PayBRI.dart';
import 'package:flutter_application_3/screens/Payment/PayGoPay.dart';
import 'package:flutter_application_3/screens/Payment/PayMandiri.dart';
import 'package:flutter_application_3/screens/Payment/PayOvo.dart';
import 'package:flutter_application_3/screens/Payment/PayPermata.dart';
import 'package:flutter_application_3/screens/Payment/PayShopee.dart';

class PaymentBokingMethodScreen extends StatelessWidget {
  final String doctorName;
  final String doctorSpecialty;
  final int consultationFee;
  final String imagePath;

  const PaymentBokingMethodScreen({
    Key? key,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.consultationFee,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Metode Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorSummary(
              doctorName: doctorName,
              doctorSpecialty: doctorSpecialty,
              consultationFee: consultationFee,
              imagePath: imagePath,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: PaymentMethods(
                doctorName: doctorName,
                doctorSpecialty: doctorSpecialty,
                consultationFee: consultationFee,
                imagePath: imagePath,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorSummary extends StatelessWidget {
  final String doctorName;
  final String doctorSpecialty;
  final int consultationFee;
  final String imagePath;

  const DoctorSummary({
    Key? key,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.consultationFee,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(imagePath),
                  radius: 30,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doctorName,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(doctorSpecialty),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Detail Pembayaran',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SummaryItem(
                title: 'Biaya Konsultasi', amount: 'Rp$consultationFee'),
            const Divider(),
            SummaryItem(
                title: 'Total Bayar',
                amount: 'Rp$consultationFee',
                isTotal: true),
          ],
        ),
      ),
    );
  }
}

class SummaryItem extends StatelessWidget {
  final String title;
  final String amount;
  final bool isTotal;

  const SummaryItem({
    Key? key,
    required this.title,
    required this.amount,
    this.isTotal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(amount,
              style: TextStyle(color: isTotal ? Colors.orange : Colors.black)),
        ],
      ),
    );
  }
}

class PaymentMethods extends StatelessWidget {
  final String doctorName;
  final String doctorSpecialty;
  final int consultationFee;
  final String imagePath;

  const PaymentMethods({
    Key? key,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.consultationFee,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PaymentMethodSection(title: 'E-Wallet', methods: [
          PaymentMethod(
              name: 'GoPay / GoPayLater',
              logo: 'assets/gopay.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PayGoPay(
                      doctorName: doctorName,
                      doctorSpecialty: doctorSpecialty,
                      consultationFee: consultationFee,
                      imagePath: imagePath,
                    ),
                  ),
                );
              }),
          PaymentMethod(
              name: 'OVO',
              logo: 'assets/ovo.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PayOvo(
                      doctorName: doctorName,
                      doctorSpecialty: doctorSpecialty,
                      consultationFee: consultationFee,
                      imagePath: imagePath,
                    ),
                  ),
                );
              }),
          PaymentMethod(
              name: 'ShopeePay',
              logo: 'assets/images/shopeepay.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PayShopee(
                      doctorName: doctorName,
                      doctorSpecialty: doctorSpecialty,
                      consultationFee: consultationFee,
                      imagePath: imagePath,
                    ),
                  ),
                );
              }),
        ]),
        PaymentMethodSection(
            title: 'Transfer Virtual Account (Verifikasi Otomatis)',
            methods: [
              PaymentMethod(
                  name: 'Bank Permata',
                  logo: 'assets/images/permata.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PayPermata(
                          doctorName: doctorName,
                          doctorSpecialty: doctorSpecialty,
                          consultationFee: consultationFee,
                          imagePath: imagePath,
                        ),
                      ),
                    );
                  }),
              PaymentMethod(
                  name: 'Bank BCA',
                  logo: 'assets/images/bca.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PayBCA(
                          doctorName: doctorName,
                          doctorSpecialty: doctorSpecialty,
                          consultationFee: consultationFee,
                          imagePath: imagePath,
                          choice: '',
                        ),
                      ),
                    );
                  }),
              PaymentMethod(
                  name: 'Bank Mandiri',
                  logo: 'assets/images/mandiri.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PayMandiri(
                          doctorName: doctorName,
                          doctorSpecialty: doctorSpecialty,
                          consultationFee: consultationFee,
                          imagePath: imagePath,
                          choice: '',
                        ),
                      ),
                    );
                  }),
              PaymentMethod(
                  name: 'Bank BNI',
                  logo: 'assets/images/bni.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PayBNI(
                          doctorName: doctorName,
                          doctorSpecialty: doctorSpecialty,
                          consultationFee: consultationFee,
                          imagePath: imagePath, choice: '',
                        ),
                      ),
                    );
                  }),
              PaymentMethod(
                  name: 'Bank BRI',
                  logo: 'assets/images/bri.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PayBRI(
                          doctorName: doctorName,
                          doctorSpecialty: doctorSpecialty,
                          consultationFee: consultationFee,
                          imagePath: imagePath,
                        ),
                      ),
                    );
                  }),
            ]),
      ],
    );
  }
}

class PaymentMethodSection extends StatelessWidget {
  final String title;
  final List<PaymentMethod> methods;

  const PaymentMethodSection(
      {Key? key, required this.title, required this.methods})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        Column(
          children: methods,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class PaymentMethod extends StatelessWidget {
  final String name;
  final String logo;
  final bool hasIcon;
  final VoidCallback? onTap;

  const PaymentMethod(
      {Key? key,
      required this.name,
      required this.logo,
      this.hasIcon = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Image.asset(logo, width: 40, height: 40),
        title: Text(name),
        trailing: hasIcon ? const Icon(Icons.arrow_forward) : null,
        onTap: onTap,
      ),
    );
  }
}
