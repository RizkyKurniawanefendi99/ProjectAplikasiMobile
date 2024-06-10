import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Article> articles = [
    Article(
      category: "Hidup sehat",
      title: "Mengenal Amino Acid dan Fungsinya untuk Tubuh",
      imageUrl: "https://via.placeholder.com/150",
    ),
    Article(
      category: "Kesehatan",
      title: "Ini Ciri-Ciri Kecanduan Game Online dan Cara Mengatasinya",
      imageUrl: "https://via.placeholder.com/150",
    ),
    Article(
      category: "Kesehatan",
      title: "Merasa Lelah Sepanjang Waktu? Atasi dengan 5 Cara Ini",
      imageUrl: "https://via.placeholder.com/150",
    ),
    Article(
      category: "Kesehatan",
      title: "Berbagai Gejala Penyakit Jantung dan Pencegahannya",
      imageUrl: "https://via.placeholder.com/150",
    ),
    Article(
      category: "Hidup sehat",
      title: "Jangan Bingung Lagi, Ini Pilihan Olahraga untuk Mengecilkan Perut",
      imageUrl: "https://via.placeholder.com/150",
    ),
    Article(
      category: "Kesehatan",
      title: "Mengetahui Proses Pembersihan Karang Gigi",
      imageUrl: "https://via.placeholder.com/150",
    ),
    Article(
      category: "Kesehatan",
      title: "Gejala Penyakit Jantung Koroner yang Perlu Diketahui",
      imageUrl: "https://via.placeholder.com/150",
    ),
    Article(
      category: "Hidup sehat",
      title: "Intip Manfaat Berhubungan Seksual Sebelum Tidur di Malam Hari",
      imageUrl: "https://via.placeholder.com/150",
    ),
    Article(
      category: "Kesehatan",
      title: "13 Hal yang Dapat Menyebabkan Bintik Merah pada Kulit",
      imageUrl: "https://via.placeholder.com/150",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jelajahi Informasi'),
        actions: [
          IconButton(
            icon: Icon(Icons.email),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari artikel, obat, penyakit, atau tanya jawab',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.network(articles[index].imageUrl),
                      title: Text(articles[index].title),
                      subtitle: Text(articles[index].category),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Article {
  final String category;
  final String title;
  final String imageUrl;

  Article({required this.category, required this.title, required this.imageUrl});
}
