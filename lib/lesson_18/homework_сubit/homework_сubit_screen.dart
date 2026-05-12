import 'package:flutter/material.dart';

class HomeworkCubitScreen extends StatelessWidget {
  const HomeworkCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Counter'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: Text(
          'This is the Cubit Counter Screen',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
