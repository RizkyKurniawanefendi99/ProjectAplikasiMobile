import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<String> doctors = [
    "Dr. Roki",
    "Dr. Paijo",
    "Dr. Iqbal",
    "Dr. Rizky",
  ];

  String selectedDoctor = "Dr. Rizky";
  String? _searchTerm;

  List<String> messages = [
    "Selamat pagi, Dok!",
    "Saya ingin membuat janji untuk bertemu dengan Anda.",
  ];

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final filteredDoctors = _searchTerm == null || _searchTerm!.isEmpty
        ? doctors
        : doctors
            .where((doctor) =>
                doctor.toLowerCase().contains(_searchTerm!.toLowerCase()))
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Dokter'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context, delegate: DoctorSearchDelegate(doctors));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButtonFormField<String>(
              value: selectedDoctor,
              onChanged: (newValue) {
                setState(() {
                  selectedDoctor = newValue!;
                });
              },
              items: filteredDoctors.map((doctor) {
                return DropdownMenuItem(
                  value: doctor,
                  child: Text(doctor),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      messages[index],
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Ketik pesan Anda...',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                MaterialButton(
                  onPressed: () {
                    String newMessage = messageController.text;
                    setState(() {
                      messages.add(newMessage);
                      messageController.clear();
                    });
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('Kirim'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorSearchDelegate extends SearchDelegate<String> {
  final List<String> doctors;

  DoctorSearchDelegate(this.doctors);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredDoctors = doctors
        .where((doctor) => doctor.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: filteredDoctors.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredDoctors[index]),
          onTap: () {
            close(context, filteredDoctors[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredDoctors = doctors
        .where((doctor) => doctor.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: filteredDoctors.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredDoctors[index]),
          onTap: () {
            query = filteredDoctors[index];
            showResults(context);
          },
        );
      },
    );
  }
}
