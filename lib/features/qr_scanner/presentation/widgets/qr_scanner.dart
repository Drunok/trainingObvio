import 'dart:typed_data';

import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:flutter/material.dart';

class QrScanner extends StatelessWidget {
  const QrScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
          facing: CameraFacing.front,
        ),

      onDetect: (capture) {
        final List<Barcode> barcodes = capture.barcodes;
        // final Uint8List? image  = capture.image;
         for (final barcode in barcodes) {
            print('Barcode found! ${barcode.rawValue}');
          }
      }, 
    );
  }
}