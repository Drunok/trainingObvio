import 'package:flutter/material.dart';
import 'package:qr_training_obvio/features/qr_scanner/presentation/pages/qrscanner_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Training Obvio'),
        ),
        body: const Center(
          child: Text('Hola mundo'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const QrScannerPage()
              )
            );
          },
          child: const Icon (Icons.add),
        )
      );
  }
}