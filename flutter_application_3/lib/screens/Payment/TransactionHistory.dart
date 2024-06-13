import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionHistoryScreen extends StatefulWidget {
  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _transactions.isEmpty
            ? Center(
                child: Text(
                  'Belum ada transaksi.',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: _transactions.length,
                itemBuilder: (context, index) {
                  final transaction = _transactions[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(transaction.productName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nomor Referensi: ${transaction.referenceNumber}',
                          ),
                          Text(
                            'Jumlah: IDR ${transaction.amount.toStringAsFixed(2)}',
                          ),
                          Text(
                            'Metode Pembayaran: ${transaction.paymentMethod}',
                          ),
                          Text(
                            'Waktu Pembayaran: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(transaction.dateTime)}',
                          ),
                          Text(
                            'Pengirim: ${transaction.senderName}',
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
