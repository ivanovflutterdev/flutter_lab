import 'package:flutter/material.dart';
import 'package:flutter_lab/main.dart';
import 'package:go_router/go_router.dart';

class StateManagementBaseScreen extends StatelessWidget {
  const StateManagementBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FeatureCard(
              title: 'Cubit Example',
              onTap: () => context.go('/counter-app/cubit'),
            ),
            SizedBox(height: 12),
            FeatureCard(
              title: 'Bloc Example',
              onTap: () => context.go('/counter-app/bloc'),
            ),
          ],
        ),
      ),
    );
  }
}
