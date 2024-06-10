import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Quizzz/LeaderboardScreen.dart';

class MentalHealthScreen extends StatefulWidget {
  const MentalHealthScreen({super.key});

  @override
  _MentalHealthScreenState createState() => _MentalHealthScreenState();
}

class _MentalHealthScreenState extends State<MentalHealthScreen> {
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
        'Apa gejala umum dari depresi?',
        [
          'Energi meningkat',
          'Kebahagiaan berlebihan',
          'Kehilangan minat pada aktivitas',
          'Tidur lebih baik'
        ],
        2),
    Question(
        'Apa praktik yang baik untuk menjaga kesehatan mental?',
        [
          'Mengisolasi diri',
          'Mengabaikan perasaan',
          'Olahraga teratur',
          'Bekerja berlebihan'
        ],
        2),
    Question('Manakah dari ini yang bisa menjadi tanda kecemasan?',
        ['Ketenangan', 'Nafas stabil', 'Detak jantung cepat', 'Relaksasi'], 2),
    Question(
        'Bagaimana mindfulness dapat membantu meningkatkan kesehatan mental?',
        [
          'Dengan mengabaikan masalah',
          'Dengan fokus pada saat ini',
          'Dengan menghindari interaksi sosial',
          'Dengan terlalu banyak berpikir'
        ],
        1),
    Question(
        'Untuk apa Cognitive Behavioral Therapy (CBT) digunakan?',
        [
          'Kebugaran fisik',
          'Meningkatkan nutrisi',
          'Mengubah pola pikir negatif',
          'Meningkatkan penggunaan media sosial'
        ],
        2),
    Question(
        'Apa cara efektif untuk mengatasi stres?',
        [
          'Minum berlebihan',
          'Latihan pernapasan dalam',
          'Menekan emosi',
          'Menunda pekerjaan'
        ],
        1),
    Question(
        'Apa tujuan dari kampanye kesadaran kesehatan mental?',
        [
          'Menstigma kesehatan mental',
          'Mengabaikan masalah kesehatan mental',
          'Meningkatkan kesadaran dan pemahaman',
          'Mencegah mencari bantuan'
        ],
        2),
    Question(
        'Manakah dari berikut ini yang dapat berdampak negatif pada kesehatan mental?',
        [
          'Pola tidur teratur',
          'Hubungan sehat',
          'Stres kronis',
          'Aktivitas fisik'
        ],
        2),
    Question(
        'Apa manfaat berbicara dengan profesional kesehatan mental?',
        [
          'Menerima penilaian',
          'Diabaikan',
          'Mendapatkan dukungan dan bimbingan profesional',
          'Menghindari masalah'
        ],
        2),
    Question(
        'Apa yang dapat membantu meningkatkan kualitas tidur dan kesehatan mental?',
        [
          'Menggunakan layar sebelum tidur',
          'Jadwal tidur yang konsisten',
          'Minum kafein di malam hari',
          'Tidur pada waktu yang tidak teratur'
        ],
        1),
    Question(
        'Apa gejala dari gangguan panik?',
        [
          'Ketenangan berlebihan',
          'Perasaan terlepas dari kenyataan',
          'Konsentrasi meningkat',
          'Emosi stabil'
        ],
        1),
    Question(
        'Bagaimana dukungan sosial dapat bermanfaat bagi kesehatan mental?',
        [
          'Dengan mengisolasi Anda',
          'Dengan memberikan dukungan emosional',
          'Dengan meningkatkan stres',
          'Dengan mempromosikan kesepian'
        ],
        1),
    Question(
        'Apa cara sehat untuk mengekspresikan emosi?',
        [
          'Menekannya',
          'Mengabaikannya',
          'Berbicara tentangnya',
          'Menyangkal keberadaannya'
        ],
        2),
    Question(
        'Apa yang bisa menjadi tanda kelelahan (burnout)?',
        [
          'Merasa berenergi',
          'Produktivitas meningkat',
          'Kelelahan kronis',
          'Kejernihan mental meningkat'
        ],
        2),
    Question(
        'Apa praktik yang baik untuk mengelola kesehatan mental di tempat kerja?',
        [
          'Bekerja berlebihan',
          'Istirahat teratur',
          'Mengabaikan stres',
          'Menghindari interaksi sosial'
        ],
        1),
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
        title: const Text('Mental Health Basics'),
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
