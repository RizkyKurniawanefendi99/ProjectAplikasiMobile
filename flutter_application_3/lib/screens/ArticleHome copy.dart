import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class InstagramDashboard extends StatefulWidget {
  @override
  _InstagramDashboardState createState() => _InstagramDashboardState();
}

class _InstagramDashboardState extends State<InstagramDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        centerTitle: true,
        title: const Text(
          'Artikel',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return PostItem(
                  judul:
                      'Cara Menjaga Kesehatan Tubuh Agar Terhindar dari Penyakit$index',
                  gambar: 'assets/images/artikel1.jpg',
                  content: loremIpsum(words: 30, initWithLorem: true),
                );
                Divider();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final String judul;
  final String gambar;
  final String content;

  PostItem({
    required this.judul,
    required this.gambar,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              SizedBox(width: 8.0),
              Text(
                judul,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
            ],
          ),
        ),
        Image.asset(gambar),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
    );
  }
}
