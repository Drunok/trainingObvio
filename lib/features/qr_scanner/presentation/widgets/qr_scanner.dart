import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:flutter/material.dart';
import 'package:qr_training_obvio/features/qr_scanner/presentation/bloc/qr_scanner_bloc.dart';

class QrScanner extends StatelessWidget {

  const QrScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 300),
      child: MobileScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
          // facing: CameraFacing.front,
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          // final Uint8List? image  = capture.image;
          for (final barcode in barcodes) {
            print('Barcode found! ${barcode.rawValue}');
            
              addQREvent(context, barcode.rawValue ?? '');
            
          }
        },
      ),
    );
  }

  void addQREvent(BuildContext context, String qrRawInfo) {
    BlocProvider.of<QrScannerBloc>(context)
        .add(GetValidationForScannedQREvent(qrScannedData: qrRawInfo));
  }
}
