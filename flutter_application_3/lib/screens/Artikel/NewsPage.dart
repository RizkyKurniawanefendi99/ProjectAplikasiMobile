import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Artikel/news_detail_page.dart';

class NewsPage extends StatelessWidget {
  final List<News> newsList = [
    News(
      imageUrl: 'assets/images/amin-acid.jpg',
      title: 'Mengenal Amino Acid dan Fungsinya untuk Tubuh',
      description:
          'Amino acid atau asam amino adalah protein yang sudah dipecah menjadi lebih kecil.',
      detailPage: MengenalAminoAcidDetailPage(),
    ),
    News(
      imageUrl: 'assets/images/gameaddiction.jpg',
      title: 'Ini Ciri-Ciri Kecanduan Game Online dan Cara Mengatasinya',
      description:
          'Kecanduan game online bisa dialami siapa saja, baik anak-anak, remaja, hingga orang dewasa.',
      detailPage: KecanduanGameDetailPage(),
    ),
    News(
      imageUrl: 'assets/images/healthy-eating.jpg',
      title: 'Pentingnya Pola Makan Sehat untuk Kesehatan',
      description: 'Makan sehat sangat penting untuk menjaga kesehatan tubuh.',
      detailPage: HealthyEatingDetailPage(),
    ),
    News(
      imageUrl: 'assets/images/fitness.jpg',
      title: 'Manfaat Olahraga Rutin untuk Kesehatan',
      description: 'Olahraga rutin memberikan banyak manfaat bagi tubuh.',
      detailPage: FitnessDetailPage(),
    ),
    News(
      imageUrl: 'assets/images/sleep.jpg',
      title: 'Pentingnya Tidur yang Cukup dan Berkualitas',
      description:
          'Tidur cukup dan berkualitas sangat penting untuk kesehatan.',
      detailPage: SleepDetailPage(),
    ),
    News(
      imageUrl: 'assets/images/mental-health.jpg',
      title: 'Menjaga Kesehatan Mental di Tengah Pandemi',
      description: 'Pandemi membawa banyak tantangan bagi kesehatan mental.',
      detailPage: MentalHealthDetailPage(),
    ),
    News(
      imageUrl: 'assets/images/stress-management.jpg',
      title: 'Tips Mengelola Stres dengan Baik',
      description: 'Mengelola stres penting untuk menjaga kesejahteraan.',
      detailPage: StressManagementDetailPage(),
    ),
    News(
      imageUrl: 'assets/images/immune-system.jpg',
      title: 'Cara Meningkatkan Sistem Imun Tubuh',
      description: 'Sistem imun yang kuat membantu melawan penyakit.',
      detailPage: ImmuneSystemDetailPage(),
    ),
    News(
      imageUrl: 'assets/images/heart-health.jpg',
      title: 'Pola Hidup Sehat untuk Jantung',
      description: 'Menjaga kesehatan jantung penting untuk hidup sehat.',
      detailPage: HealthyEatingDetailPage(),
    ),
    News(
      imageUrl: 'assets/images/brain-health.jpg',
      title: 'Cara Meningkatkan Kesehatan Otak',
      description: 'Kesehatan otak penting untuk fungsi kognitif yang optimal.',
      detailPage: BrainHealthDetailPage(),
    ),
  ];

 NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jelajahi Informasi'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari artikel, obat, penyakit, atau tanya jawab',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return NewsCard(news: newsList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class News {
  final String imageUrl;
  final String title;
  final String description;
  final Widget detailPage;

  News({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.detailPage,
  });
}

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => news.detailPage,
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.asset(
                news.imageUrl,
                height: 150.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    news.description,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
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
