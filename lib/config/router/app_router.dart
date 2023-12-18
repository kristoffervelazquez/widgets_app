import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';
import 'package:widgets_app/presentation/screens/test/test_screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/buttons',
    name: ButtonsScreen.name,
    builder: (context, state) => const ButtonsScreen(),
  ),
  GoRoute(
    path: '/cards',
    name: CardsScreen.name,
    builder: (context, state) => const CardsScreen(),
  ),
  GoRoute(
    path: '/test',
    name: TestScreen.name,
    builder: (context, state) => const TestScreen(),
  )
]);
