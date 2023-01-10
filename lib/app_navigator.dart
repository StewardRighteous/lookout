import 'package:go_router/go_router.dart';
import 'package:lookout/homepage.dart';
import 'package:lookout/selection_page.dart';

class AppNavigator {
  static final appRouter = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'selection_page',
            builder: (context, state) => const SelectionPage(),
          ),
        ],
      ),
    ],
  );
}
