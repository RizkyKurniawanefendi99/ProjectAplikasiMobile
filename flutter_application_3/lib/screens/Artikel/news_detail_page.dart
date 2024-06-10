import 'package:flutter/material.dart';

class MengenalAminoAcidDetailPage extends StatelessWidget {
  const MengenalAminoAcidDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mengenal Amino Acid dan Fungsinya untuk Tubuh'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/amin-acid.jpg',
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Mengenal Amino Acid dan Fungsinya untuk Tubuh',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Amino acid atau asam amino adalah protein yang sudah dipecah menjadi lebih kecil. '
              'Asam amino sangat penting untuk berbagai fungsi tubuh, termasuk membangun otot, '
              'memproduksi enzim dan hormon, serta memperbaiki jaringan tubuh.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KecanduanGameDetailPage extends StatelessWidget {
  const KecanduanGameDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Ini Ciri-Ciri Kecanduan Game Online dan Cara Mengatasinya'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/game-addiction.jpg',
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Ini Ciri-Ciri Kecanduan Game Online dan Cara Mengatasinya',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Kecanduan game online bisa dialami siapa saja, baik anak-anak, remaja, hingga orang dewasa. '
              'Beberapa ciri-ciri kecanduan game online antara lain: sering bermain game berjam-jam, '
              'mengabaikan tanggung jawab sehari-hari, dan merasa cemas atau marah ketika tidak bisa bermain. '
              'Untuk mengatasi kecanduan game, penting untuk menetapkan batasan waktu bermain, '
              'mencari kegiatan alternatif yang menyenangkan, dan meminta bantuan profesional jika diperlukan.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HealthyEatingDetailPage extends StatelessWidget {
  const HealthyEatingDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pentingnya Pola Makan Sehat untuk Kesehatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/healthy-eating.jpg',
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Pentingnya Pola Makan Sehat untuk Kesehatan',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Makan sehat sangat penting untuk menjaga kesehatan tubuh. '
              'Ini membantu dalam menjaga berat badan ideal, mengurangi risiko penyakit kronis, '
              'dan memperbaiki kesehatan mental. Pastikan untuk mengonsumsi berbagai jenis makanan '
              'yang kaya akan nutrisi dan seimbang.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FitnessDetailPage extends StatelessWidget {
  const FitnessDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manfaat Olahraga Rutin untuk Kesehatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/fitness.jpg',
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Manfaat Olahraga Rutin untuk Kesehatan',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Olahraga rutin memberikan banyak manfaat bagi tubuh, termasuk meningkatkan kebugaran, '
              'mengontrol berat badan, dan memperbaiki kesehatan mental. '
              'Luangkan waktu setidaknya 30 menit setiap hari untuk berolahraga agar tubuh tetap sehat dan bugar.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SleepDetailPage extends StatelessWidget {
  const SleepDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pentingnya Tidur yang Cukup dan Berkualitas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/sleep.jpg',
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Pentingnya Tidur yang Cukup dan Berkualitas',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Tidur cukup dan berkualitas sangat penting untuk kesehatan. '
              'Ini membantu dalam pemulihan tubuh, meningkatkan fungsi otak, dan menjaga keseimbangan emosional. '
              'Pastikan untuk tidur setidaknya 7-9 jam setiap malam agar tubuh dan pikiran tetap sehat.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MentalHealthDetailPage extends StatelessWidget {
  const MentalHealthDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menjaga Kesehatan Mental di Tengah Pandemi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/mental-health.jpg',
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Menjaga Kesehatan Mental di Tengah Pandemi',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Pandemi membawa banyak tantangan bagi kesehatan mental. '
              'Penting untuk menjaga kesehatan mental dengan melakukan aktivitas yang menyenangkan, '
              'menjaga komunikasi dengan orang terdekat, dan meminta bantuan profesional jika diperlukan. '
              'Jangan ragu untuk mencari dukungan jika merasa kewalahan.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StressManagementDetailPage extends StatelessWidget {
  const StressManagementDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tips Mengelola Stres dengan Baik'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/stress-management.jpg',
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Tips Mengelola Stres dengan Baik',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Mengelola stres penting untuk menjaga kesejahteraan. '
              'Beberapa cara untuk mengelola stres antara lain: melakukan olahraga, '
              'bermeditasi, mengatur waktu dengan baik, dan menjaga hubungan sosial yang positif. '
              'Jangan biarkan stres mengendalikan hidup Anda, cari cara yang efektif untuk mengelolanya.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImmuneSystemDetailPage extends StatelessWidget {
  const ImmuneSystemDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cara Meningkatkan Sistem Imun Tubuh'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/immune-system.jpg',
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Cara Meningkatkan Sistem Imun Tubuh',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Sistem imun yang kuat membantu melawan penyakit. '
              'Beberapa cara untuk meningkatkan sistem imun antara lain: makan makanan bergizi, '
              'berolahraga secara teratur, cukup tidur, dan mengelola stres. '
              'Pastikan untuk menjaga pola hidup sehat agar sistem imun tetap kuat.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeartHealthDetailPage extends StatelessWidget {
  const HeartHealthDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pola Hidup Sehat untuk Jantung'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/heart-health.jpg',
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Pola Hidup Sehat untuk Jantung',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Menjaga kesehatan jantung penting untuk hidup sehat. '
              'Beberapa cara untuk menjaga kesehatan jantung antara lain: makan makanan rendah lemak jenuh, '
              'berolahraga secara teratur, tidak merokok, dan menjaga tekanan darah dalam batas normal. '
              'Pola hidup sehat dapat membantu mengurangi risiko penyakit jantung.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BrainHealthDetailPage extends StatelessWidget {
  const BrainHealthDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cara Meningkatkan Kesehatan Otak'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/brain-health.jpg',
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Cara Meningkatkan Kesehatan Otak',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Kesehatan otak penting untuk fungsi kognitif yang optimal. '
              'Beberapa cara untuk meningkatkan kesehatan otak antara lain: melakukan aktivitas yang menantang secara mental, '
              'berolahraga secara teratur, makan makanan yang sehat, dan cukup tidur. '
              'Jaga kesehatan otak agar dapat berpikir dengan jernih dan fokus.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
