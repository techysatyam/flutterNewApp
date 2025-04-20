import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newwhhrrr/app/dashboard/bloc/dashboard_bloc.dart';
import 'package:newwhhrrr/app/dashboard/models/get_all_app_model.dart';
import '../../app/auth/bloc/auth_bloc.dart';
import '../../app/auth/screens/create_password_screen.dart';
import '../../app/auth/screens/forget_password_screen.dart';
import '../../app/auth/screens/login_screen.dart';
import '../../app/auth/screens/splash_screen.dart';
import '../../app/auth/screens/verify_otp_screen.dart';
import '../../app/bloc/app_bloc.dart';
import '../../app/dashboard/add_form/add_form.dart';
import '../../app/dashboard/add_form/view_form.dart';
import '../../app/dashboard/dashboard_screen.dart';
import '../../app/dashboard/main_layout.dart';
import '../../app/dashboard/user_panel/app_list_screen.dart';
import '../../app/dashboard/user_panel/user_main_screen.dart';
import '../../app/dashboard/workInProgress.dart';
import '../widgets/placeholder_screens/route_error_screen.dart';

class GoRouterService {
  static GoRouterService? _instance;
  static GoRouterState? lastRouteState;
  final GoRouter router;

  GoRouterService._({required this.router});

  BuildContext? get context =>
      router.routerDelegate.navigatorKey.currentContext;

  factory GoRouterService.instance({required AppBloc bloc}) {
    _instance ??= GoRouterService._(
      router: GoRouter(
        initialLocation: AppListScreen.route,
        routes: [
          ShellRoute(
            builder: (context, state, child) {
              final parentUrl = state.pathParameters['parentId'] ?? "";
              final childUrl = state.pathParameters['childId'] ?? "";

              return SplashScreen(
                nextScreen: MainScreenUser(
                  child: child,
                ),
              );
            },
            routes: [
              GoRoute(
                path: '/app_list',
                builder: (context, state) {
                  return AppListScreen();
                },
                routes: [
                  GoRoute(
                    path: '/view_form',
                    builder: (context, state) {
                      final args = state.extra as GetForm?;
                      return ViewForm(getForm: args);
                    },
                  ),
                ],
              ),
            ],
          ),

          ShellRoute(
              builder: (context, state, child) {
                final parentUrl = state.pathParameters['parentId'] ?? "";
                final childUrl = state.pathParameters['childId'] ?? "";
                return /*AppListScreen();*/
                    MainLayout(
                  parentUrl: "/$parentUrl",
                  childUrl: childUrl.isEmpty ? "" : "/$childUrl",
                  child: child,
                );
              },
              routes: [
                GoRoute(
                    path: DashboardScreen.route,
                    pageBuilder: (context, state) => MaterialPage(
                          child: const DashboardScreen(),
                        ),
                    routes: [
                      GoRoute(
                        path: '/add_form',
                        builder: (context, state) {
                          return AddForm();
                        },
                      ),
                      GoRoute(
                        path: '/view_form',
                        builder: (context, state) {
                          final args = state.extra as GetForm?;
                          return ViewForm(
                            getForm: args,
                          );
                        },
                      ),
                    ]),
              ]),
        ],
        errorBuilder: (context, state) => const RouteErrorScreen(),
        redirect: (context, state) {},
        refreshListenable: RouterSubscription(bloc.stream),
      ),
    );
    return _instance!;
  }

  // Call this method to reset router when needed (e.g., on logout)
  static void reset() {
    _instance = null;
  }
}

class RouterSubscription extends ChangeNotifier {
  late final StreamSubscription<AppState> _subscription;

  RouterSubscription(Stream<AppState> stream) {
    _subscription = stream.listen((event) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
