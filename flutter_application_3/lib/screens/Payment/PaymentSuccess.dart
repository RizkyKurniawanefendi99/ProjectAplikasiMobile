import 'package:flutter/material.dart';

class PaymentSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Success'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.blue[50],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle_outline,
                size: 120,
                color: Colors.blue,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Payment Success!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              Text(
                'Funds will arrive in 4 hours.',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(height: 30),
              Text(
                '\$1,250.50',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Merchant Nickname: Swellcorp',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue[900],
                ),
              ),
              // ... Additional details and buttons
            ],
          ),
        ),
      ),
    );
  }
}