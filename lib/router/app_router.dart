import 'package:flutter_lab/lesson_11/homework_11_screen.dart';
import 'package:flutter_lab/lesson_12/visit_evaluation_screen.dart';
import 'package:flutter_lab/lesson_13/constraints.dart';
import 'package:flutter_lab/lesson_18/homework_bloc/homework_bloc_screen.dart';
import 'package:flutter_lab/lesson_18/homework_cubit/homework_cubit_screen.dart';
import 'package:flutter_lab/lesson_18/state_management_base_screen.dart';
import 'package:flutter_lab/main.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: 'constraints',
          builder: (context, state) => WidgetConstrainsTrainingScreen(),
        ),
        GoRoute(path: 'screen', builder: (context, state) => Screen()),
        GoRoute(
          path: 'visit-evaluation',
          builder: (context, state) => VisitEvaluationScreen(),
        ),
        GoRoute(
          path: 'counter-app',
          builder: (context, state) => StateManagementBaseScreen(),
          routes: [
            GoRoute(
              path: 'cubit',
              builder: (context, state) => HomeworkCubitScreen(),
            ),
            GoRoute(
              path: 'bloc',
              builder: (context, state) => HomeworkBlocScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
