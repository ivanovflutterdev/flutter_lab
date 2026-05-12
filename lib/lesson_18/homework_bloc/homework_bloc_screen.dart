import 'package:flutter/material.dart';

class HomeworkBlocScreen extends StatelessWidget {
  const HomeworkBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: Text(
          'This is the Bloc Counter Screen',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
