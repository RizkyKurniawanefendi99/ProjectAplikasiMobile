import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_3/navbar/navbar.dart';
import 'package:flutter_application_3/screens/Quizzz/Pilihan%20Quiz/HealthNutritionScreen.dart';
import 'package:flutter_application_3/screens/Quizzz/Pilihan%20Quiz/MentalHealthScreen.dart';
import 'package:flutter_application_3/screens/Quizzz/Pilihan%20Quiz/PhysicalExerciseScreen.dart';

class HealthQuizScreen extends StatefulWidget {
  const HealthQuizScreen({super.key});

  @override
  _HealthQuizScreenState createState() => _HealthQuizScreenState();
}

class _HealthQuizScreenState extends State<HealthQuizScreen> {
  final List<String> imgList = [
    'https://via.placeholder.com/400x200',
    'https://via.placeholder.com/400x200',
    'https://via.placeholder.com/400x200'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuis Kesehatan'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Add your logout logic here
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Navbar()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Lets play',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const Text(
                'And be the first!',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20.0),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: imgList
                    .map((item) => Container(
                          child: Center(
                            child: Image.network(item,
                                fit: BoxFit.cover, width: 1000),
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Recent Quiz',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10.0),
              QuizCard(
                title: 'Health and Nutrition',
                questions: '10/10 Question',
                icon: Icons.local_dining,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const HealthNutritionQuizScreen()),
                  );
                },
              ),
              QuizCard(
                title: 'Mental Health Basics',
                questions: '15/15 Question',
                icon: Icons.psychology,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MentalHealthScreen()),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Live Quiz',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10.0),
              QuizCard(
                title: 'Physical Exercise',
                questions: '1253 User playing',
                icon: Icons.fitness_center,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PhysicalExerciseScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  final String title;
  final String questions;
  final IconData icon;
  final VoidCallback onTap;

  const QuizCard({
    super.key,
    required this.title,
    required this.questions,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 40.0, color: Colors.blue),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  questions,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
