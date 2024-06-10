import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/Artikel/NewsPage.dart';
import 'package:flutter_application_3/screens/HealthMonotoring/HealthMonitoring.dart';
import 'package:flutter_application_3/screens/Quizzz/HealthQuizScreen.dart';
import 'package:flutter_application_3/screens/buy/BuyDrugScreen.dart';
import 'package:flutter_application_3/screens/calender/CalenderScreen.dart';
import 'package:flutter_application_3/screens/Profile/ProfileScreen.dart';
import 'package:flutter_application_3/screens/Record/NotificationScreen.dart';
import 'package:flutter_application_3/screens/Chat/MessageScreen.dart';
import 'package:flutter_application_3/screens/member/member.dart';
import 'package:flutter_application_3/screens/recordmedic/RecordMedic.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final TextEditingController _textController = TextEditingController();

  final List<String> _promotions = [
    'assets/images/Promosi1.png',
    'assets/images/Promosi2.jpg',
    'assets/images/Promosi3.jpg',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoSlide();
    });
  }

  void _startAutoSlide() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      if (_pageController.hasClients) {
        int nextPage = _currentPage + 1;
        if (nextPage >= _promotions.length) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        setState(() {
          _currentPage = nextPage;
        });
        _startAutoSlide();
      }
    });
  }

  void _addPromotion(String assetName) {
    if (assetName.isNotEmpty) {
      setState(() {
        _promotions.add('assets/images/$assetName');
      });
      _textController.clear();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Selamat Pagi, Janna',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari dokter atau apapun',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _promotions.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        _promotions[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildFeatureIcon(Icons.monitor, 'Monitoring', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HealthMonitoringMain()),
                    );
                  }),
                  _buildFeatureIcon(Icons.local_hospital, 'Rumah Sakit', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  }),
                  _buildFeatureIcon(Icons.people, 'Konsultan', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MessageScreen()),
                    );
                  }),
                  _buildFeatureIcon(Icons.receipt, 'Resep', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsPage()),
                    );
                  }),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Dokter Teratas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildDoctorTile('dr. Dhayu Eprida', 'Endokrinolog', 4.8),
              _buildDoctorTile('dr. Dhanang Prast', 'Neurolog', 4.8),
              _buildDoctorTile('dr. Jasmine Bella', 'Kardiolog', 4.8),
              const SizedBox(height: 20),
              const Text(
                'Fitur Lainnya',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildDashboardItem(
                    context,
                    'Jadwal Dokter',
                    Icons.event,
                    Colors.blue[700]!,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalendarScreen()),
                      );
                    },
                  ),
                  _buildDashboardItem(
                    context,
                    'Chat Dokter',
                    Icons.chat,
                    Colors.blue[600]!,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MessageScreen()),
                      );
                    },
                  ),
                  _buildDashboardItem(
                    context,
                    'Menu Obat',
                    Icons.medication,
                    Colors.blue[500]!,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BuyDrugScreen()),
                      );
                    },
                  ),
                  _buildDashboardItem(
                    context,
                    'Menu Artikel',
                    Icons.article,
                    Colors.blue[400]!,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewsPage()),
                      );
                    },
                  ),
                  _buildDashboardItem(
                    context,
                    'Riwayat Penyakit',
                    Icons.history,
                    Colors.blue[300]!,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RecordMedic()),
                      );
                    },
                  ),
                  _buildDashboardItem(
                    context,
                    'Member',
                    Icons.card_membership,
                    Colors.blue[200]!,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MemberScreen()),
                      );
                    },
                  ),
                  _buildDashboardItem(
                    context,
                    'Kuis Kesehatan',
                    Icons.quiz,
                    Colors.blue[100]!,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HealthQuizScreen()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Icon(icon, size: 30),
          ),
          const SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildDoctorTile(String name, String specialty, double rating) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey[200],
        child: Icon(Icons.person, size: 30, color: Colors.grey[800]),
      ),
      title: Text(name),
      subtitle: Text(specialty),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.yellow[700], size: 20),
          const SizedBox(width: 5),
          Text(rating.toString()),
        ],
      ),
    );
  }

  Widget _buildDashboardItem(
    BuildContext context,
    String title,
    IconData iconData,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.8), color.withOpacity(0.5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: ListTile(
            leading: Icon(
              iconData,
              color: Colors.white,
              size: 36.0,
            ),
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
