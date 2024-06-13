import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Payment/PayScreenBooking.dart';
import 'package:flutter_application_3/screens/buy/BuyDrugScreen.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  _ShoppingCart createState() => _ShoppingCart();
}

class _ShoppingCart extends State<ShoppingCart> {
  int quantity = 1;
  String alamat = 'Belum ada alamat'; // Variable to store the address
  bool isFreeShipping = false;
  final TextEditingController _voucherController = TextEditingController();
  String selectedEkspedisi = 'JNE';
  String selectedPaymentMethod =
      'Bank'; // Variable to store selected payment method

  void _tambahAlamatDialog() {
    TextEditingController alamatController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tambah Alamat'),
          content: TextField(
            controller: alamatController,
            decoration: const InputDecoration(hintText: "Masukkan alamat"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Simpan'),
              onPressed: () {
                setState(() {
                  alamat = alamatController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _applyVoucher() {
    // Logika untuk validasi kode voucher
    if (_voucherController.text == 'FREEONGKIR') {
      setState(() {
        isFreeShipping = true;
      });
    } else {
      setState(() {
        isFreeShipping = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Semua Barang'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Alamat Pengiriman'),
            subtitle: Text(alamat),
            trailing: TextButton(
              onPressed: _tambahAlamatDialog,
              child: const Text('Tambah Alamat'),
            ),
          ),
          ListTile(
            title: const Text('Kode Voucher'),
            subtitle: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _voucherController,
                    decoration:
                        const InputDecoration(hintText: "Masukkan kode voucher"),
                  ),
                ),
                ElevatedButton(
                  onPressed: _applyVoucher,
                  child: const Text('Apply'),
                ),
              ],
            ),
          ),
          SwitchListTile(
            title: const Text('Gratis ongkos kirim telah ditambahkan'),
            value: isFreeShipping,
            onChanged: (bool value) {
              setState(() {
                isFreeShipping = value;
              });
            },
          ),
          ListTile(
            title: const Text('Pilih Ekspedisi'),
            subtitle: DropdownButton<String>(
              value: selectedEkspedisi,
              items: <String>['JNE', 'TIKI', 'Pos IDN']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedEkspedisi = newValue!;
                });
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.network(
                  'https://lifepack.id/wp-content/uploads/2020/12/WhatsApp-Image-2021-08-09-at-10.35.24.jpeg'),
              title: const Text('Apotek K-24 Jend. Sudirman'),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Paracetamol 500mg'), // Nama obat
                  Text('Rp37.800'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) quantity--;
                      });
                    },
                  ),
                  Text('$quantity'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: const Text('+ Tambah Barang Lainnya'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BuyDrugScreen()),
                );
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Total Bayar'),
            trailing: Text('Rp${(37.800 * quantity).toStringAsFixed(2)}'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentBokingMethodScreen(
                      doctorName: 'Apotek K-24 Jend. Sudirman',
                      doctorSpecialty: 'Paracetamol 500mg',
                      consultationFee: (37800 * quantity).toInt(),
                      imagePath:
                          'https://lifepack.id/wp-content/uploads/2020/12/WhatsApp-Image-2021-08-09-at-10.35.24.jpeg',
                    ),
                  ),
                );
                // Aksi ketika tombol beli ditekan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Beli'),
            ),
          ),
        ],
      ),
    );
  }
}
