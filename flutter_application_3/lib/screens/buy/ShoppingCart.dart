import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/buy/BuyDrugScreen.dart';
import 'package:flutter_application_3/screens/Payment/PayScreen.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCart createState() => _ShoppingCart();
}

class _ShoppingCart extends State<ShoppingCart> {
  int quantity = 1;
  String alamat = 'Belum ada alamat'; // Variable to store the address
  bool isFreeShipping = false;
  TextEditingController _voucherController = TextEditingController();
  String selectedEkspedisi = 'JNE';
  String selectedPaymentMethod =
      'Bank'; // Variable to store selected payment method

  void _tambahAlamatDialog() {
    TextEditingController _alamatController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah Alamat'),
          content: TextField(
            controller: _alamatController,
            decoration: InputDecoration(hintText: "Masukkan alamat"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Simpan'),
              onPressed: () {
                setState(() {
                  alamat = _alamatController.text;
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
        title: Text('Pilih Semua Barang'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Alamat Pengiriman'),
            subtitle: Text(alamat),
            trailing: TextButton(
              child: Text('Tambah Alamat'),
              onPressed: _tambahAlamatDialog,
            ),
          ),
          ListTile(
            title: Text('Kode Voucher'),
            subtitle: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _voucherController,
                    decoration:
                        InputDecoration(hintText: "Masukkan kode voucher"),
                  ),
                ),
                ElevatedButton(
                  child: Text('Apply'),
                  onPressed: _applyVoucher,
                ),
              ],
            ),
          ),
          SwitchListTile(
            title: Text('Gratis ongkos kirim telah ditambahkan'),
            value: isFreeShipping,
            onChanged: (bool value) {
              setState(() {
                isFreeShipping = value;
              });
            },
          ),
          ListTile(
            title: Text('Pilih Ekspedisi'),
            subtitle: DropdownButton<String>(
              value: selectedEkspedisi,
              items: <String>['JNE', 'TIKI', 'Pos Indonesia']
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
              title: Text('Apotek K-24 Jend. Sudirman'),
              subtitle: Column(
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
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) quantity--;
                      });
                    },
                  ),
                  Text('$quantity'),
                  IconButton(
                    icon: Icon(Icons.add),
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
              child: Text('+ Tambah Barang Lainnya'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuyDrugScreen()),
                );
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Total Bayar'),
            trailing: Text('Rp${(37.800 * quantity).toStringAsFixed(2)}'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              child: Text('Beli'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentMethodScreen()),
                );
                // Aksi ketika tombol beli ditekan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
