import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_training_obvio/features/qr_scanner/presentation/bloc/qr_scanner_bloc.dart';
import 'package:qr_training_obvio/features/qr_scanner/presentation/widgets/qr_scanner.dart';
import 'package:qr_training_obvio/injection_container.dart';

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
          )),
      body: const BuildBody(),
    );
  }
}

class BuildBody extends StatelessWidget {
  const BuildBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<QrScannerBloc>(),
      child:  Center(
        child: BlocBuilder<QrScannerBloc, QrScannerState>(
          builder: (context, state) {
            if (state is QrScannerLoading) {}
            if (state is QrScannerCorrect) {
              print(state.messageCorrect);
            }
            return const QrScanner();
          },
        ),
        // child: Placeholder(),
      ),
    );
  }
}
