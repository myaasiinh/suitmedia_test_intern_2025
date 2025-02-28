import 'package:go_router/go_router.dart';
import '../../feature/first/first_screen.dart';
import '../../feature/second/second_screen.dart';
import '../../feature/third/third_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/first-screen',
  routes: [
    GoRoute(
      path: '/first-screen',
      builder: (context, state) => const FirstScreen(),
    ),
    GoRoute(
      path: '/second-screen',
      builder: (context, state) {
        final name = state.extra as String;
        return SecondScreen(name: name);
      },
    ),
    GoRoute(
      path: '/third-screen',
      builder: (context, state) => const ThirdScreen(),
    ),
  ],
);
