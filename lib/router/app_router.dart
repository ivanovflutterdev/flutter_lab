import 'package:flutter_lab/error_handling_homework/presentation/ui/screens/user_profile_homework_screen.dart';
import 'package:flutter_lab/lesson_11/homework_11_screen.dart';
import 'package:flutter_lab/lesson_12/visit_evaluation_screen.dart';
import 'package:flutter_lab/lesson_13/constraints.dart';
import 'package:flutter_lab/lesson_18/homework_bloc/homework_bloc_screen.dart';
import 'package:flutter_lab/lesson_18/homework_cubit/homework_cubit_screen.dart';
import 'package:flutter_lab/lesson_18/state_management_base_screen.dart';
import 'package:flutter_lab/lesson_19/screens/rate_app_screen.dart';
import 'package:flutter_lab/lesson_21/explicit_animations_screen.dart';
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
        GoRoute(
          name: 'rateApp',
          path: '/rate-app',
          builder: (context, state) => const RateAppScreen(),
        ),
                GoRoute(
          name: 'explicitAnimations',
          path: '/explicit-animations',
          builder: (context, state) => const ExplicitAnimationsScreen(),
        ),
        GoRoute(
          name: 'errorHandling',
          path: 'error-handling',
          builder: (context, state) => UserProfileHomeworkScreen(),
        ),
      ],
    ),
  ],
);
