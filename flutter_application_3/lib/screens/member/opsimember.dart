import 'package:flutter/material.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REPROTEKSI'),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text(
                    'Paket Yang Tersedia',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'REPROTEKSI',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            children: [
                              Icon(Icons.chat, color: Colors.grey),
                              SizedBox(width: 8),
                              Text('Chat Dokter'),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Unlimited free chat ke dokter spesialis 24 jam, dokter pribadi dan gratis ongkir dan obat',
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Rp 35.000/bulan',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Implement detail view
                                },
                                child: const Text('Lihat Detail'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Implement subscription functionality
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                ),
                                child: const Text('Daftar'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Pilih Periode',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text('Bayar Bulanan'),
              subtitle: const Text('Bayar tiap bulan, batalkan kapan saja'),
              trailing: const Text('Rp 35.000/bulan'),
              leading: Radio(
                value: 'monthly',
                groupValue: 'period',
                onChanged: (value) {
                  // Handle selection
                },
              ),
            ),
            ListTile(
              title: const Text('Bayar Tahunan'),
              subtitle: const Text('Jadi member penuh selama setahun'),
              trailing: const Text('Rp 30.000/bulan'),
              leading: Radio(
                value: 'yearly',
                groupValue: 'period',
                onChanged: (value) {
                  // Handle selection
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement selection functionality
              },
              child: const Text('Pilih'),
            ),
          ],
        ),
      ),
    );
  }
}
