import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Payment/PayBCA.dart';
import 'package:flutter_application_3/screens/Payment/PayBNI.dart';
import 'package:flutter_application_3/screens/Payment/PayBRI.dart';
import 'package:flutter_application_3/screens/Payment/PayGoPay.dart';
import 'package:flutter_application_3/screens/Payment/PayMandiri.dart';
import 'package:flutter_application_3/screens/Payment/PayOvo.dart';
import 'package:flutter_application_3/screens/Payment/PayPermata.dart';
import 'package:flutter_application_3/screens/Payment/PayShopee.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentMethodScreen(),
    );
  }
}

class PaymentMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Metode Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PurchaseSummary(),
            SizedBox(height: 16),
            PaymentMethods(),
          ],
        ),
      ),
    );
  }
}

class PurchaseSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ringkasan Pembelian',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            SummaryItem(title: 'Total Pesanan', amount: 'Rp47.803'),
            SummaryItem(title: 'Ongkos Kirim', amount: 'Rp10.100'),
            SummaryItem(title: 'Diskon Ongkos Kirim', amount: '-Rp10.100'),
            SummaryItem(title: 'Biaya Layanan', amount: 'Rp0'),
            Divider(),
            SummaryItem(
                title: 'Total Bayar', amount: 'Rp47.803', isTotal: true),
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

  SummaryItem(
      {required this.title, required this.amount, this.isTotal = false});

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
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          PaymentMethodSection(title: 'E-Wallet', methods: [
            PaymentMethod(
                name: 'GoPay / GoPayLater',
                logo: 'assets/gopay.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PayGoPay()),
                  );
                }),
            PaymentMethod(
                name: 'OVO',
                logo: 'assets/ovo.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PayOvo()),
                  );
                }),
            PaymentMethod(
                name: 'ShopeePay',
                logo: 'assets/images/shopeepay.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PayShopee()),
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
                        MaterialPageRoute(builder: (context) => PayPermata()),
                      );
                    }),
                PaymentMethod(
                    name: 'Bank BCA',
                    logo: 'assets/images/bca.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PayBCA()),
                      );
                    }),
                PaymentMethod(
                    name: 'Bank Mandiri',
                    logo: 'assets/images/mandiri.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PayMandiri()),
                      );
                    }),
                PaymentMethod(
                    name: 'Bank BNI',
                    logo: 'assets/images/bni.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PayBNI()),
                      );
                    }),
                PaymentMethod(
                    name: 'Bank BRI',
                    logo: 'assets/images/bri.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PayBRI()),
                      );
                    }),
              ]),
        ],
      ),
    );
  }
}

class PaymentMethodSection extends StatelessWidget {
  final String title;
  final List<PaymentMethod> methods;

  PaymentMethodSection({required this.title, required this.methods});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 8),
        Column(
          children: methods,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class PaymentMethod extends StatelessWidget {
  final String name;
  final String logo;
  final bool hasIcon;
  final VoidCallback? onTap;

  PaymentMethod(
      {required this.name,
      required this.logo,
      this.hasIcon = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Image.asset(logo, width: 40, height: 40),
        title: Text(name),
        trailing: hasIcon ? Icon(Icons.arrow_forward) : null,
        onTap: onTap,
      ),
    );
  }
}