import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Chat/ChatScreen.dart';
import 'package:flutter_application_3/screens/Expedition/Expedition.dart';
import 'package:flutter_application_3/navbar/navbar.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PaySuccess extends StatelessWidget {
  final String referenceNumber;
  final DateTime dateTime;
  final String paymentMethod;
  final double amount;
  final String senderName;
  final String productName;

  const PaySuccess({
    super.key,
    required this.referenceNumber,
    required this.dateTime,
    required this.paymentMethod,
    required this.amount,
    required this.senderName,
    required this.productName, required String choice,
  });

  Future<void> _createPDF() async {
    final pdf = pw.Document();
    final date = DateFormat('yyyy-MM-dd').format(dateTime);
    final time = DateFormat('HH:mm:ss').format(dateTime);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Pembayaran Berhasil!',
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),
              pw.Text('Jumlah: IDR ${amount.toStringAsFixed(2)}'),
              pw.Text('Status Pembayaran: Berhasil'),
              pw.Text('Nomor Referensi: $referenceNumber'),
              pw.Text('Nama Produk: $productName'),
              pw.Text('Metode Pembayaran: $paymentMethod'),
              pw.Text('Waktu Pembayaran: $date $time'),
              pw.Text('Pengirim: $senderName'),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  void _navigateToChat(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(
          doctorName: senderName,
          doctorSpecialty: productName,
          consultationFee: amount.toInt(),
          imagePath: 'assets/doctor.jpg',
        ),
      ),
    );
  }

  void _navigateToExpedition(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExpeditionScreen(
          nomorResi: 'RI457GTWYPPP01',
          tanggal: DateTime.now(),
          layanan: 'CepatAntar Bondowoso (Instant Day)',
          berat: '1.2 Kg',
          status: 'Dalam pengiriman',
          harga: 'Rp 11.000',
          riwayatPengiriman: [
            TrackingHistory(
              status: 'Terkirim',
              lokasi: 'Apotek Sehat, Bondowoso',
              tanggal: DateTime.now().subtract(Duration(hours: 1)),
            ),
            TrackingHistory(
              status: 'Sedang dalam perjalanan',
              lokasi: 'Jalan Raya Bondowoso',
              tanggal: DateTime.now().subtract(Duration(hours: 2)),
            ),
            TrackingHistory(
              status: 'Penyortiran selesai',
              lokasi: 'Bondowoso',
              tanggal: DateTime.now().subtract(Duration(hours: 3)),
            ),
            TrackingHistory(
              status: 'Diproses di fasilitas sortir',
              lokasi: 'Bondowoso',
              tanggal: DateTime.now().subtract(Duration(hours: 4)),
            ),
            TrackingHistory(
              status: 'Berangkat dari gudang',
              lokasi: 'Gudang Pusat, Bondowoso',
              tanggal: DateTime.now().subtract(Duration(hours: 5)),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToBookingHistory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Navbar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('yyyy-MM-dd').format(dateTime);
    final time = DateFormat('HH:mm:ss').format(dateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran Berhasil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 100),
                  SizedBox(height: 16),
                  Text('Pembayaran Berhasil!',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(
                    'Pembayaran Anda telah berhasil.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jumlah', style: TextStyle(fontSize: 16)),
                  Text('IDR ${amount.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange)),
                  SizedBox(height: 8),
                  Text('Status Pembayaran', style: TextStyle(fontSize: 16)),
                  Text('Berhasil',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                  SizedBox(height: 8),
                  Text('Nomor Referensi', style: TextStyle(fontSize: 16)),
                  Text(referenceNumber, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('Nama Produk', style: TextStyle(fontSize: 16)),
                  Text(productName, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('Metode Pembayaran', style: TextStyle(fontSize: 16)),
                  Text(paymentMethod, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('Waktu Pembayaran', style: TextStyle(fontSize: 16)),
                  Text('$date, $time', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('Pengirim', style: TextStyle(fontSize: 16)),
                  Text(senderName, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.download),
                label: Text('Unduh Resi PDF'),
                onPressed: _createPDF,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(39, 110, 177, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.chat, size: 16),
                      label: Text('Mulai Chat'),
                      onPressed: () => _navigateToChat(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.local_shipping, size: 16),
                      label: Text('Lacak Paket'),
                      onPressed: () => _navigateToExpedition(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.home, size: 16),
                      label: Text('Beranda'),
                      onPressed: () => _navigateToBookingHistory(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Transaction {
  final String referenceNumber;
  final DateTime dateTime;
  final String paymentMethod;
  final double amount;
  final String senderName;
  final String productName;

  Transaction({
    required this.referenceNumber,
    required this.dateTime,
    required this.paymentMethod,
    required this.amount,
    required this.senderName,
    required this.productName,
  });
}

class TransactionHistory extends StatefulWidget {
  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  final List<Transaction> _transactions = [];

  void _addTransaction(Transaction transaction) {
    setState(() {
      _transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Transaksi'),
      ),
      body: ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: (context, index) {
          final transaction = _transactions[index];
          return ListTile(
            title: Text(transaction.productName),
            subtitle: Text(
                '${transaction.referenceNumber} - ${DateFormat('dd MMM yyyy, HH:mm').format(transaction.dateTime)}'),
            trailing: Text('IDR ${transaction.amount.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TransactionHistory(),
  ));
}
