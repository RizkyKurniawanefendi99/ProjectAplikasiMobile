// HealthNutritionQuizScreen.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Quizzz/LeaderboardScreen.dart';
// Import the UserScore class

class HealthNutritionQuizScreen extends StatefulWidget {
  const HealthNutritionQuizScreen({super.key});

  @override
  _HealthNutritionQuizScreenState createState() =>
      _HealthNutritionQuizScreenState();
}

class _HealthNutritionQuizScreenState extends State<HealthNutritionQuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool answerSelected = false;
  bool correctAnswerSelected = false;
  bool showResult = false;
  int timer = 30;
  List<UserScore> userScores = [];

  List<Question> questions = [
    Question(
        'Berapa jumlah air yang sebaiknya dikonsumsi oleh orang dewasa setiap hari?',
        ['1-2 liter', '2-3 liter', '3-4 liter', '4-5 liter'],
        1),
    Question(
        'Manakah dari berikut ini yang merupakan cara efektif untuk mengurangi risiko penyakit jantung?',
        [
          'Merokok',
          'Mengonsumsi makanan tinggi lemak jenuh',
          'Berolahraga secara teratur dan menjaga pola makan sehat',
          'Menghindari aktivitas fisik'
        ],
        2),
    Question('Makanan manakah yang paling tinggi kandungan seratnya?',
        ['Daging sapi', 'Kacang-kacangan', 'Ikan salmon', 'Keju'], 1),
    Question('Vitamin apa yang terutama diperoleh dari sinar matahari?',
        ['Vitamin A', 'Vitamin B', 'Vitamin C', 'Vitamin D'], 3),
    Question('Berapa banyak porsi buah dan sayur yang disarankan per hari?',
        ['1-2 porsi', '3-4 porsi', '5-7 porsi', '8-10 porsi'], 2),
    Question('Olahraga apa yang baik untuk kesehatan jantung?',
        ['Mengangkat beban', 'Jogging', 'Main catur', 'Bermain video game'], 1),
    Question('Manakah dari berikut ini yang bukan merupakan sumber protein?',
        ['Telur', 'Ikan', 'Beras', 'Kacang tanah'], 2),
    Question('Berapa jumlah waktu tidur yang ideal untuk orang dewasa?',
        ['4-5 jam', '6-7 jam', '7-8 jam', '9-10 jam'], 2),
    Question(
        'Apa manfaat utama dari konsumsi serat yang cukup?',
        [
          'Menambah berat badan',
          'Meningkatkan pencernaan',
          'Menambah energi',
          'Meningkatkan penglihatan'
        ],
        1),
    Question('Manakah dari berikut ini yang termasuk lemak sehat?',
        ['Lemak trans', 'Lemak jenuh', 'Lemak tak jenuh', 'Lemak perut'], 2),
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        if (timer > 0) {
          setState(() {
            timer--;
          });
          startTimer();
        } else {
          endQuiz();
        }
      }
    });
  }

  void checkAnswer(int index) {
    setState(() {
      answerSelected = true;
      if (index == questions[currentQuestionIndex].correctAnswerIndex) {
        correctAnswerSelected = true;
        score++;
      } else {
        correctAnswerSelected = false;
      }
      showResult = true;
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        answerSelected = false;
        correctAnswerSelected = false;
        showResult = false;
      } else {
        endQuiz();
      }
    });
  }

  void endQuiz() {
    setState(() {
      userScores.add(UserScore('User', score));
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LeaderboardScreen(userScores: userScores),
      ),
    );
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health and Nutrition Quiz'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              backgroundColor: Colors.grey[300],
              color: Colors.green,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${currentQuestionIndex + 1} of ${questions.length}',
                    style: const TextStyle(fontSize: 20)),
                Text(formatTime(timer),
                    style: const TextStyle(fontSize: 20, color: Colors.purple)),
              ],
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  questions[currentQuestionIndex].questionText,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...questions[currentQuestionIndex].answers.map((answer) {
              int answerIndex =
                  questions[currentQuestionIndex].answers.indexOf(answer);
              return GestureDetector(
                onTap: () {
                  if (!answerSelected) {
                    checkAnswer(answerIndex);
                  }
                },
                child: Card(
                  color: answerSelected
                      ? (answerIndex ==
                              questions[currentQuestionIndex].correctAnswerIndex
                          ? Colors.green.withOpacity(0.5)
                          : Colors.red.withOpacity(0.5))
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(
                          answerSelected
                              ? (answerIndex ==
                                      questions[currentQuestionIndex]
                                          .correctAnswerIndex
                                  ? Icons.check_circle
                                  : Icons.cancel)
                              : Icons.circle,
                          color: answerSelected
                              ? (answerIndex ==
                                      questions[currentQuestionIndex]
                                          .correctAnswerIndex
                                  ? Colors.green
                                  : Colors.red)
                              : Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            answer,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
            if (showResult)
              Center(
                child: ElevatedButton(
                  onPressed: nextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                  ),
                  child: const Text('Next'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> answers;
  final int correctAnswerIndex;

  Question(this.questionText, this.answers, this.correctAnswerIndex);
}
