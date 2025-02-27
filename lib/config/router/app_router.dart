import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/counter/counter_screen.dart';
import 'package:widgets_app/presentation/screens/screens.dart';
import 'package:widgets_app/presentation/screens/theme_changer/theme_changer_screen.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context, state) => const HomeScreen()
    ),
    GoRoute(
      name: ButtonsScreen.name,
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      name: CardsScreen.name,
      path: '/cards', 
      builder: (context, state) => const CardsScreen()
    ),
    GoRoute(
      name: ProgressScreen.name,
      path: '/progress', 
      builder: (context, state) => const ProgressScreen()
    ),
    GoRoute(
      name: SnackbarScreen.name,
      path: '/snackbars', 
      builder: (context, state) => const SnackbarScreen()
    ),
    GoRoute(
      name: AnimatedScreen.name,
      path: '/animated', 
      builder: (context, state) => const AnimatedScreen()
    ),
    GoRoute(
      name: UiControlsScreen.name,
      path: '/ui-controls', 
      builder: (context, state) => const UiControlsScreen(),
    ),
    GoRoute(
      name: TutorialScreen.name,
      path: '/tutorial', 
      builder: (context, state) => const TutorialScreen(),
    ),
    GoRoute(
      name: InfiniteScrollScreen.name,
      path: '/infinite', 
      builder: (context, state) => const InfiniteScrollScreen(),
    ),
    GoRoute(
      name: CounterScreen.name,
      path: '/counter-river', 
      builder: (context, state) => const CounterScreen(),
    ),
    GoRoute(
      name: ThemeChangerScreen.name,
      path: '/theme-changer', 
      builder: (context, state) => const ThemeChangerScreen(),
    ),
  ],
);