import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Alexa'),
    
    ),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/scan'),
          child: Container(
            width: 100,
            height: 30,
            color: Colors.black,
            child: Center(child: Text('Scan QR',style: TextStyle(color: Colors.white),)),
          ),
        ),
      ),
    ),
    );
  }
}