import 'package:flutter/material.dart';

import 'package:qr_training_obvio/features/qr_scanner/presentation/pages/home_page.dart';
import 'package:qr_training_obvio/injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage()
    );
  }
}
