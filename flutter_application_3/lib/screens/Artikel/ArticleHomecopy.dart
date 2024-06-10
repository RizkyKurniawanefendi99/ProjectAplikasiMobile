import 'package:flutter/material.dart';

class InstagramDashboard extends StatefulWidget {
  @override
  _InstagramDashboardState createState() => _InstagramDashboardState();
}

class _InstagramDashboardState extends State<InstagramDashboard> {
  final List<Article> articles = [
    Article(
      category: "Hidup sehat",
      title: "Mengenal Amino Acid dan Fungsinya untuk Tubuh",
      imageUrl: "https://via.placeholder.com/150",
      content: "Amino acid atau asam amino adalah protein yang sudah dipecah melalui proses metabolisme menjadi molekul-molekul kecil. Dengan demikian, sel-sel tubuh akan lebih mudah menggunakan zat ini untuk berbagai kebutuhan, mulai dari mendukung proses pemulihan luka hingga pembentukan sel baru.",
    ),
    Article(
      category: "Kesehatan",
      title: "Ini Ciri-Ciri Kecanduan Game Online dan Cara Mengatasinya",
      imageUrl: "https://via.placeholder.com/150",
      content: "Kecanduan game online bisa dialami siapa saja, baik anak-anak, remaja, hingga orang dewasa. Gejala kecanduan ini dapat berupa keinginan bermain yang terus-menerus, mengabaikan kegiatan lainnya, hingga merasa gelisah saat tidak bermain.",
    ),
    // Add more articles as needed
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
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari artikel, obat, penyakit, atau tanya jawab',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.lightBlue[50],
            child: Row(
              children: [
                Icon(Icons.verified, color: Colors.blue),
                SizedBox(width: 8.0),
                Text("Mitra resmi dari", style: TextStyle(color: Colors.blue)),
                SizedBox(width: 8.0),
                Image.network(
                  'https://via.placeholder.com/100x20', // Replace with actual image URL
                  width: 100,
                  height: 20,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return PostItem(
                  judul: articles[index].title,
                  gambar: articles[index].imageUrl,
                  kategori: articles[index].category,
                  content: articles[index].content,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Article {
  final String category;
  final String title;
  final String imageUrl;
  final String content;

  Article({
    required this.category,
    required this.title,
    required this.imageUrl,
    required this.content,
  });
}

class PostItem extends StatelessWidget {
  final String judul;
  final String gambar;
  final String kategori;
  final String content;

  PostItem({
    required this.judul,
    required this.gambar,
    required this.kategori,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(gambar),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              kategori,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              judul,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(content),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.send),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.bookmark_border),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
