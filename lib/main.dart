import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/error_handling_homework/data/repository/fake_user_repository.dart';
import 'package:flutter_lab/error_handling_homework/presentation/cubit/user_profile_cubit.dart';
import 'package:flutter_lab/lesson_18/homework_bloc/counter_bloc.dart';
import 'package:flutter_lab/lesson_18/homework_cubit/counter_cubit.dart';
import 'package:flutter_lab/lesson_19/bloc/rate_app_cubit.dart';
import 'package:flutter_lab/router/app_router.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(FlutterWifgetsApp());
}

class FlutterWifgetsApp extends StatelessWidget {
  const FlutterWifgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => RateAppCubit()),
        BlocProvider(
          create: (context) =>
              UserProfileCubit(FakeUserRepository())..loadUserProfile(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
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
              onTap: () => context.go('/screen'),
            ),
            SizedBox(height: 12),
            FeatureCard(
              title: 'Lesson 12 - Visit Evaluation',
              onTap: () => context.go('/visit-evaluation'),
            ),
            SizedBox(height: 12),
            FeatureCard(
              title: 'Lesson 13 - Constraints',
              onTap: () => context.go('/constraints'),
            ),
            SizedBox(height: 12),
            FeatureCard(
              title: 'Lesson 13 - CounterApp',
              onTap: () => context.go('/counter-app'),
            ),
            SizedBox(height: 12),
            FeatureCard(
              title: 'Lesson 19 - Rate screen',
              onTap: () => context.goNamed('rateApp'),
            ),
            SizedBox(height: 12),
            FeatureCard(
              title: 'Lesson 21 - Explicit Animations',
              onTap: () => context.goNamed('explicitAnimations'),
            ),
            SizedBox(height: 12),
            FeatureCard(
              title: 'Lesson 22 - Error handling',
              onTap: () => context.goNamed('errorHandling'),
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
