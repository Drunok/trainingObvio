import 'package:flutter/material.dart';
import 'package:qr_training_obvio/features/qr_scanner/presentation/widgets/qr_scanner.dart';


class QrScannerPage extends StatelessWidget {
  const QrScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ),
      body: const Center(
        // child: QrScanner(),
        child: Placeholder(),
      ),
      
    );
  }
}

