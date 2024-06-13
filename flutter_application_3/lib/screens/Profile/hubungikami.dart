import 'package:flutter/material.dart';

class HubungiKami extends StatelessWidget {
  const HubungiKami({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 80),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person, color: Colors.grey),
                            hintText: 'Full name',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: const Color.fromARGB(255, 240, 240, 240),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email, color: Colors.grey),
                            hintText: 'Email address',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: const Color.fromARGB(255, 240, 240, 240),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.message, color: Colors.grey),
                            hintText: 'Message...',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: const Color.fromARGB(255, 240, 240, 240),
                          ),
                          maxLines: 4,
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle submit action
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 33, 150, 243),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                            ),
                            child: Text(
                              'Submit',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Column(
                      children: [
                        Text(
                          'HUBUNGI KAMI',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Color.fromARGB(255, 33, 150, 243),
                          child: Icon(Icons.support_agent, size: 50, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
