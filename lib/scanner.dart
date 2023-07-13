
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';  

class QRCodeScannerPage extends StatefulWidget {
  @override
  _QRCodeScannerPageState createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  late QRViewController _controller;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Column(
        children: [
          Expanded(
            child: QRView(
              key: _qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
     
    });
     var lastQrCodeReadDate = DateTime.now();
    controller.scannedDataStream.listen((scanData) {
      // Handle the scanned data here
      final dateNow = DateTime.now();

      if (dateNow.difference(lastQrCodeReadDate).inSeconds < 3) return;
         controller.pauseCamera(); 
      final url=Uri.https('attendance-4d5c8-default-rtdb.asia-southeast1.firebasedatabase.app','attendees.json');
      String? code = scanData.code;
      if(code!=null){
      List<String> data = code.split(',');
      if (data.length == 2) {
          String name = data[0].trim(); // Extract the name
          String email = data[1].trim(); 

          http.post(url,headers: {
        'Content-Type':'application/json',
      },body: json.encode({'Name':name,'Email':email}));
      }
      }
      
      
      Navigator.pushNamed(context, '/');

    });
  }
}
