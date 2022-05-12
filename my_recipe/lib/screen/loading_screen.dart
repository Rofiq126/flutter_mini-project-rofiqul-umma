import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
          child: LoadingFadingLine.circle(
        backgroundColor: Colors.orangeAccent,
        size: 50,
        borderColor: Colors.orange,
        duration: const Duration(milliseconds: 500),
      )),
    );
  }
}
