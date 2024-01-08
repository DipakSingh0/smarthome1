import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScannerPage extends StatefulWidget {
  const QrCodeScannerPage({Key? key}) : super(key: key);

  @override
  _QrCodeScannerPageState createState() => _QrCodeScannerPageState();
}

class _QrCodeScannerPageState extends State<QrCodeScannerPage> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  bool isScanning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Stack(
        children: [
          QRView(
            key: _qrKey,
            onQRViewCreated: (QRViewController controller) {
              controller.scannedDataStream.listen((scanData) {
                Navigator.pop(context, scanData);
              });
            },
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: isScanning ? Colors.green : Colors.transparent,
                  width: 2.0,
                ),
              ),
              child: SizedBox(
                width: 200.0,
                height: 200.0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  decoration: BoxDecoration(
                    gradient: isScanning
                        ? LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.blue.withOpacity(0.5),
                              Colors.transparent,
                            ],
                            stops: [0.0, 0.5, 1.0],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )
                        : null,
                  ),
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
    _qrKey.currentState?.dispose();
    super.dispose();
  }
}
