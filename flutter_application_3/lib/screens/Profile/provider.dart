import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileProvider extends StatefulWidget {
  final Widget child;

  ProfileProvider({required this.child});

  @override
  ProfileProviderState createState() => ProfileProviderState();

  static ProfileProviderState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_ProfileInheritedWidget>()!
        .data;
  }
}

class ProfileProviderState extends State<ProfileProvider> {
  String name = "Adm Rizky Efendi Oioi JR";
  String phoneNumber = "0896-8601-3385";

  void updateProfile(String newName, String newPhoneNumber) {
    setState(() {
      name = newName;
      phoneNumber = newPhoneNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _ProfileInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}

class _ProfileInheritedWidget extends InheritedWidget {
  final ProfileProviderState data;

  _ProfileInheritedWidget({
    required Widget child,
    required this.data,
  }) : super(child: child);

  @override
  bool updateShouldNotify(_ProfileInheritedWidget old) {
    return true;
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileState = ProfileProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Profil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        'assets/images/profile.png'), // Sesuaikan path gambar
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profileState.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(profileState.phoneNumber),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            buildSectionTitle('Akun'),
            buildCardWithNavigation(
                context, 'Profil Saya', Icons.arrow_forward_ios, ProfilePage()),
            buildCard(context, 'Transaksi Saya', Icons.arrow_forward_ios),
            const Divider(),
            buildSectionTitle('Aplikasi Remedic'),
            buildCard(context, 'Tentang Kami', Icons.arrow_forward_ios),
            buildCard(context, 'Privasi', Icons.arrow_forward_ios),
            buildCard(context, 'Syarat & Ketentuan', Icons.arrow_forward_ios),
            buildCard(context, 'Hubungi Kami', Icons.arrow_forward_ios),
            const Divider(),
            Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3,
              child: ListTile(
                title: const Text('Keluar'),
                trailing: const Icon(Icons.logout),
                onTap: () {
                  // Tambahkan fungsionalitas logout di sini
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String title, IconData trailingIcon) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: ListTile(
        title: Text(title),
        trailing: Icon(trailingIcon),
        onTap: () {
          // Tambahkan fungsionalitas navigasi di sini
        },
      ),
    );
  }

  Widget buildCardWithNavigation(BuildContext context, String title,
      IconData trailingIcon, Widget destination) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: ListTile(
        title: Text(title),
        trailing: Icon(trailingIcon),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "Rizky";
  String phoneNumber = "082 123 456 789";
  String email = "rizky@gmail.com";
  String password = "*********";
  DateTime selectedDate = DateTime(2003, 6, 3);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _editName() {
    TextEditingController _nameController = TextEditingController(text: name);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Nama'),
          content: TextField(
            controller: _nameController,
            decoration: InputDecoration(hintText: "Masukkan nama baru"),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Oke'),
              onPressed: () {
                setState(() {
                  name = _nameController.text;
                });
                ProfileProvider.of(context).updateProfile(name, phoneNumber);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editPhoneNumber() {
    TextEditingController _phoneController =
        TextEditingController(text: phoneNumber);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Nomor Telepon'),
          content: TextField(
            controller: _phoneController,
            decoration:
                InputDecoration(hintText: "Masukkan nomor telepon baru"),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Oke'),
              onPressed: () {
                setState(() {
                  phoneNumber = _phoneController.text;
                });
                ProfileProvider.of(context).updateProfile(name, phoneNumber);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editEmail() {
    TextEditingController _emailController = TextEditingController(text: email);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Email'),
          content: TextField(
            controller: _emailController,
            decoration: InputDecoration(hintText: "Masukkan email baru"),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Oke'),
              onPressed: () {
                setState(() {
                  email = _emailController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editPassword() {
    TextEditingController _passwordController =
        TextEditingController(text: password);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Password'),
          content: TextField(
            controller: _passwordController,
            decoration: InputDecoration(hintText: "Masukkan password baru"),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Oke'),
              onPressed: () {
                setState(() {
                  password = _passwordController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Action untuk kembali
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent.withOpacity(0.2),
            ),
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 24, color: Colors.blue),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.black),
                      onPressed: _editName,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.cake, color: Colors.blue),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          DateFormat('d MMM yyyy').format(selectedDate),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.black),
                        onPressed: () => _selectDate(context),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.phone, color: Colors.blue),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          phoneNumber,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.black),
                        onPressed: _editPhoneNumber,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.email, color: Colors.blue),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          email,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.black),
                        onPressed: _editEmail,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.lock, color: Colors.blue),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          password,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.black),
                        onPressed: _editPassword,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  onPressed: () {
                    // Save action
                  },
                  child: Text('Simpan', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
