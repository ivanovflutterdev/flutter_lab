import 'package:flutter/material.dart';
import 'package:flutter_lab/lesson_11/homework_11_screen.dart';
import 'package:flutter_lab/lesson_12/visit_evaluation_screen.dart';
import 'package:flutter_lab/lesson_13/constraints.dart';

void main() {
  runApp(FlutterWifgetsApp());
}

class FlutterWifgetsApp extends StatelessWidget {
  const FlutterWifgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Lab'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FeatureCard(
              title: 'Lesson 11 - Homework',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (context) => const Screen()),
              ),
            ),
            SizedBox(height: 12),
            FeatureCard(
              title: 'Lesson 12 - Visit Evaluation',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const VisitEvaluationScreen(),
                ),
              ),
            ),
            SizedBox(height: 12),
            FeatureCard(
              title: 'Lesson 13 - Constraints',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const WidgetConstrainsTrainingScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({required this.title, required this.onTap, super.key});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
