
import 'package:apple_market_app/core/router/router_path.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/detail/detail_screen.dart';
import '../../presentation/main/screen/main_root.dart';

final GoRouter router = GoRouter(
  initialLocation: RouterPath.main,
  routes: [
    GoRoute(
      path: RouterPath.main,
      builder: (context, state) => const MainRoot(),
    ),
    GoRoute(
      path: RouterPath.detail,
      builder: (context, state) => const DetailScreen(),
    ),
  ],
);
