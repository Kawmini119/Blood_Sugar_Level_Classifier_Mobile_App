import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'input_screen.dart';

void main() {
  runApp(const Diabetesapp());
}

class Diabetesapp extends StatelessWidget {
  const Diabetesapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Blood Sugar level Classifier',// App title
      theme: ThemeData(
        
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
  
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 38.0,
          title: const Text(''),
          backgroundColor:
              Color.fromARGB(255, 59, 187, 187),
        ),
        body: const InputScreen(),
      ),
    );
  }
}