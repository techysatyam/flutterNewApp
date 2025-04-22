import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_projects/app/dashboard/bloc/dashboard_bloc.dart';

import '../common/navigation_service/go_router_service.dart';
import '../common/utils/theme/theme.dart';
import 'bloc/app_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => AppBloc(),
      ),
      BlocProvider(
        create: (context) => DashboardBloc(),
      ),
    ], child: _App());
    //   BlocProvider(
    //   create: (context) => AppBloc(),
    //   child: const _App(),
    // );
  }
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig:
              GoRouterService.instance(bloc: context.read<AppBloc>()).router,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          themeMode: state.themeMode,
          theme: CustomAppTheme.lightTheme,
          darkTheme: CustomAppTheme.darkTheme,
          // onGenerateRoute: RouteGenerator.generateRoute, for mobile app
        );
      },
    );
  }
}
