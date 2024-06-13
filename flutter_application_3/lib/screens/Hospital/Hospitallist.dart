import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: DaftarRumahSakit(),
  ));
}

class DaftarRumahSakit extends StatelessWidget {
  final List<Map<String, String>> rumahSakit = [
    {
      "nama": "RS Dr. Soebandi",
      "alamat": "Jl. Dr. Soebandi No. 124, Jember",
      "telepon": "0331-487441",
      "gambar":
          "https://lh5.googleusercontent.com/p/AF1QipOWe_S9nB2mRh56BlA6fEne2rbwEzF5b_Z5LAw=w426-h240-k-no",
      "deskripsi": "Rumah Sakit Umum Daerah dengan fasilitas lengkap di Jember."
    },
    {
      "nama": "RS Bina Sehat",
      "alamat": "Jl. Jayanegara No. 86, Jember",
      "telepon": "0331-486611",
      "gambar":
          "https://lh5.googleusercontent.com/p/AF1QipNAbHz-IobE6K4ekDVy2ftVTQbAMjh7NieGYS4j=w426-h240-k-no",
      "deskripsi": "Rumah sakit swasta dengan layanan kesehatan berkualitas."
    },
    {
      "nama": "RS Citra Husada",
      "alamat": "Jl. KH. Shiddiq No. 22, Jember",
      "telepon": "0331-482232",
      "gambar":
          "https://lh5.googleusercontent.com/p/AF1QipO-MKiejjjzK_jiQlj-1vJlLgIsyhhrwztSuJQ=w408-h306-k-no",
      "deskripsi": "Pelayanan kesehatan prima dengan teknologi medis terbaru."
    },
    {
      "nama": "RS Kaliwates",
      "alamat": "Jl. Gajah Mada No. 233, Jember",
      "telepon": "0331-487545",
      "gambar":
          "https://lh5.googleusercontent.com/p/AF1QipNjN28z6CgNhitdGuE2DnKVACNeA58hTQF0UyJM=w408-h544-k-no",
      "deskripsi": "Rumah sakit dengan layanan rawat inap dan rawat jalan."
    },
    {
      "nama": "RS Mitra Sehat",
      "alamat": "Jl. Hayam Wuruk No. 60, Jember",
      "telepon": "0331-486311",
      "gambar":
          "https://lh5.googleusercontent.com/p/AF1QipN3V2D7EwVgyxqV6s5e7vWzB3CBjPoA1rclL1bD=w408-h306-k-no",
      "deskripsi": "Layanan kesehatan keluarga dengan tenaga medis profesional."
    },
    {
      "nama": "RS Paru Jember",
      "alamat": "Jl. Dr. Wahidin Sudiro Husodo No. 45, Jember",
      "telepon": "0331-487238",
      "gambar":
          "https://lh5.googleusercontent.com/p/AF1QipOiC8B9XsTZ2pzzrJQHsiQvELpOHp7Ki3QOfQZB=w408-h306-k-no",
      "deskripsi": "Rumah sakit khusus paru dengan fasilitas lengkap."
    },
    {
      "nama": "RS Bhakti Husada",
      "alamat": "Jl. Gajah Mada No. 45, Jember",
      "telepon": "0331-487311",
      "gambar":
          "https://lh5.googleusercontent.com/p/AF1QipP0sCjHsyBc-rONSkP6-cZnOwhx-58QzKux8bc6=w426-h240-k-no",
      "deskripsi": "Pelayanan medis unggulan dengan teknologi canggih."
    },
    {
      "nama": "RS Al-Huda",
      "alamat": "Jl. PB. Sudirman No. 75, Genteng",
      "telepon": "0331-487111",
      "gambar":
          "https://lh5.googleusercontent.com/p/AF1QipMsQX7s_qbUbcm5VD2-f1AL2PqL-CfyNQF1Pab3=w408-h306-k-no",
      "deskripsi": "Rumah sakit dengan pelayanan kesehatan islami."
    },
    {
      "nama": "RSU Kalianget",
      "alamat": "Jl. Raya Kalianget No. 7, Sumenep",
      "telepon": "0331-487222",
      "gambar":
          "https://lh5.googleusercontent.com/p/AF1QipPUfJtrLjY2X-2m60X0GLn_U1E-sD-sJ7_vrNu6=w408-h306-k-no",
      "deskripsi": "Rumah sakit umum daerah dengan berbagai layanan medis."
    },
    {
      "nama": "RS Balung",
      "alamat": "Jl. Raya Balung No. 15, Balung",
      "telepon": "0331-487333",
      "gambar":
          "https://lh5.googleusercontent.com/p/AF1QipNeppUrmP_1k5y6DeV1ue7hTrKc93sdUoVtvRT4=w408-h306-k-no",
      "deskripsi": "Layanan kesehatan terpadu dengan fasilitas modern."
    }
  ];

  Future<List<Map<String, String>>> fetchRumahSakit() async {
    // Simulasikan pencarian data dengan jeda waktu
    await Future.delayed(Duration(seconds: 3));
    return rumahSakit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rumah Sakit Terdekat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tombol atas
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on, color: Colors.blue),
                SizedBox(width: 8),
                Text('Rumah Sakit Sekitar',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
              ],
            ),
            SizedBox(height: 20),
            // Daftar rumah sakit
            Expanded(
              child: FutureBuilder<List<Map<String, String>>>(
                future: fetchRumahSakit(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    final rumahSakit = snapshot.data!;
                    return ListView.builder(
                      itemCount: rumahSakit.length,
                      itemBuilder: (context, index) {
                        final rs = rumahSakit[index];
                        return _buildHospitalCard(rs["nama"], rs["alamat"],
                            rs["telepon"], rs["gambar"], rs["deskripsi"]);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHospitalCard(String? nama, String? alamat, String? telepon,
      String? gambar, String? deskripsi) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              nama!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            leading: Image.network(gambar!,
                height: 60, width: 60, fit: BoxFit.cover),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.blue),
                    SizedBox(width: 8),
                    Expanded(child: Text(alamat!)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.phone, color: Colors.blue),
                    SizedBox(width: 8),
                    Text(telepon!),
                  ],
                ),
              ],
            ),
          ),
          ExpansionTile(
            title: Text(
              'Deskripsi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(deskripsi!),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
