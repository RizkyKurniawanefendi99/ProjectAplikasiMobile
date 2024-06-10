import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Quizzz/LeaderboardScreen.dart';

class PhysicalExerciseScreen extends StatefulWidget {
  const PhysicalExerciseScreen({super.key});

  @override
  _PhysicalExerciseScreenState createState() => _PhysicalExerciseScreenState();
}

class _PhysicalExerciseScreenState extends State<PhysicalExerciseScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool answerSelected = false;
  bool correctAnswerSelected = false;
  bool showResult = false;
  List<UserScore> userScores = [];
  Timer? _timer;
  int _timeRemaining = 7;

  List<Question> questions = [
    Question(
        'Berapa lama waktu yang disarankan untuk berolahraga setiap minggu?',
        ['75 menit', '150 menit', '300 menit', '30 menit'],
        1),
    Question(
        'Manfaat utama dari latihan kardio adalah?',
        [
          'Meningkatkan kekuatan otot',
          'Meningkatkan daya tahan jantung',
          'Menambah berat badan',
          'Meningkatkan fleksibilitas'
        ],
        1),
    Question('Latihan apa yang termasuk dalam latihan kekuatan?',
        ['Berlari', 'Push-up', 'Bersepeda', 'Yoga'], 1),
    Question(
        'Berapa kali dalam seminggu disarankan untuk melakukan latihan kekuatan?',
        ['1 kali', '2 kali', '5 kali', 'Setiap hari'],
        1),
    Question(
        'Apa manfaat dari peregangan sebelum dan sesudah latihan?',
        [
          'Mencegah cedera',
          'Meningkatkan kecepatan',
          'Menambah massa otot',
          'Meningkatkan berat badan'
        ],
        0),
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timeRemaining = 7;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeRemaining > 0) {
          _timeRemaining--;
        } else {
          timer.cancel();
          nextQuestion();
        }
      });
    });
  }

  void checkAnswer(int index) {
    _timer?.cancel();
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
        startTimer();
      } else {
        endQuiz();
      }
    });
  }

  void endQuiz() {
    _timer?.cancel();
    setState(() {
      userScores.add(UserScore('User', score));
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LeaderboardScreen(userScores: userScores),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Physical Exercise Quiz'),
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
                Text('${currentQuestionIndex + 1} dari ${questions.length}',
                    style: const TextStyle(fontSize: 20)),
                Text('$_timeRemaining detik',
                    style: const TextStyle(fontSize: 20, color: Colors.red)),
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
            }).toList(),
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
