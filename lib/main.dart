import 'package:attendance/home.dart';
import 'package:attendance/scanner.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  
      title: 'QR Code Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      routes: {
        '/scan': (context) =>QRCodeScannerPage(),
        '/':(context) => HomePage()
      },
    );
    
  }
}