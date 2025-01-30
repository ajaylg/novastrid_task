import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:novastrid/view/blocs/dashboard/dashboard_bloc.dart';
import 'package:novastrid/view/screens/about/about.dart';
import 'package:novastrid/view/screens/dashboard/dashboard.dart';
import 'package:novastrid/view/screens/home/home.dart';
import 'package:novastrid/view/screens/profile/profile.dart';

import '../view/screens/login/login.dart';

class RouterConfigs {
  static GoRouter router = GoRouter(routes: [
    GoRoute(
      path: "/",
      name: "Login",
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: "/home",
      name: "Home",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/about",
      name: "About",
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      path: "/profile",
      name: "Profile",
      builder: (context, state) {
        final name = state.uri.queryParameters['name'] ?? "Guest User";
        final email = state.uri.queryParameters['email'] ?? "--";
        return ProfilePage(
          name: name,
          email: email,
        );
      },
    ),
    GoRoute(
      path: "/dashboard",
      name: "Dashboard",
      builder: (context, state) => BlocProvider(
        create: (context) => DashboardBloc(),
        child: const DashboardPage(),
      ),
    ),
  ]);
}
