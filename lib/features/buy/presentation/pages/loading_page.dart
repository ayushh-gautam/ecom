import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            'https://lottie.host/9c62adb0-4ce0-40d2-b8b3-2e6cbca6f169/LUWrG3gePZ.json',
            height: 200,
            repeat: true,
            reverse: true,
            animate: true),
      ),
    );
  }
}
