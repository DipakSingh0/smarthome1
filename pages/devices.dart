// devices.dart
import 'package:flutter/material.dart';
import 'package:new_app/pages/qrscanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Devices'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('This is the devices page'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the QR code scanner page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QrCodeScannerPage(),
                  ),
                );
              },
              child: const Text('Scan to Add Device'),
            ),
          ],
        ),
      ),
    );
  }
}
class _QrCodeScannerPageState extends State<QrCodeScannerPage> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Stack(
        children: [
          // Container with white background for the QR code view
          Container(
            color: Colors.white,
            child: AspectRatio(
              aspectRatio: 1.0, // Set the aspect ratio to 1:1 for a square frame
              child: QRView(
                key: _qrKey,
                onQRViewCreated: (QRViewController controller) {
                  // Implement the logic to handle scanned QR code data
                  controller.scannedDataStream.listen((scanData) {
                    // Handle the scanned data (e.g., navigate back and pass the data)
                    Navigator.pop(context, scanData);
                  });
                },
              ),
            ),
          ),
          // Text below the QR code view
          const Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Scan a device',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _qrKey.currentState?.dispose();
    super.dispose();
  }
}
