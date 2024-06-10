import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Quizzz/HealthQuizScreen.dart';

class LeaderboardScreen extends StatelessWidget {
  final List<UserScore> userScores;

  const LeaderboardScreen({super.key, required this.userScores});

  @override
  Widget build(BuildContext context) {
    userScores.sort((a, b) => b.score.compareTo(a.score));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HealthQuizScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSummaryCard(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: userScores.length,
                itemBuilder: (context, index) {
                  return _buildUserTile(userScores[index], index + 1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    int totalQuestions = 10; // Contoh jumlah total pertanyaan
    int correctAnswers =
        userScores[0].score; // Mengasumsikan skor adalah jumlah jawaban benar
    int wrongAnswers = totalQuestions - correctAnswers;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Selamat!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Anda telah mencetak +${correctAnswers * 10} poin",
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSummaryColumn(
                    'Total Pertanyaan', totalQuestions.toString()),
                _buildSummaryColumn('Benar', correctAnswers.toString()),
                _buildSummaryColumn('Salah', wrongAnswers.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryColumn(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 5),
        Text(value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildUserTile(UserScore userScore, int rank) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(rank.toString()),
        ),
        title: Text(userScore.username),
        subtitle: Text('Jawaban Benar: ${userScore.score}'),
        trailing: Text(
          '${(userScore.score / 10 * 100).toStringAsFixed(0)}%', // Mengasumsikan 10 pertanyaan total
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class UserScore {
  final String username;
  final int score;

  UserScore(this.username, this.score);
}
