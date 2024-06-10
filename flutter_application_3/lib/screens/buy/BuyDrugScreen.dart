import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Payment/PayScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BuyDrugScreen(),
    );
  }
}

class BuyDrugScreen extends StatefulWidget {
  const BuyDrugScreen({super.key});

  @override
  _BuyDrugScreenState createState() => _BuyDrugScreenState();
}

class _BuyDrugScreenState extends State<BuyDrugScreen> {
  int _cartItemCount = 0;

  void _addItemToCart() {
    setState(() {
      _cartItemCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Obat, Vitamin, Suplemen'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ShoppingCart(cartItemCount: _cartItemCount),
                    ),
                  );
                },
              ),
              Positioned(
                right: 0,
                child: _cartItemCount > 0
                    ? Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '$_cartItemCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari obat, vitamin, suplemen daya tahan tubuh',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // Aksi ketika tombol "Upload Resep" ditekan
                },
                child: const Text('Upload Resep'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Aksi ketika tombol "Tampilkan Toko Terdekat" ditekan
                },
                child: const Text('Tampilkan Toko Terdekat'),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Image.asset(
                            'assets/drug_placeholder.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Obat ${index + 1}',
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Rp ${10000 * (index + 1)}',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            onPressed: _addItemToCart,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            child: const Text('Tambah'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  final int cartItemCount;

  const ShoppingCart({super.key, required this.cartItemCount});

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
