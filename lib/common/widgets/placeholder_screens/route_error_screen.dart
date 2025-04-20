import 'package:flutter/material.dart';

class RouteErrorScreen extends StatelessWidget {
  const RouteErrorScreen({super.key});

  static const String route = '404';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Page not found',
          style: TextStyle(
            color: Theme.of(context).colorScheme.shadow,
          ),
        ),
      ),
    );
  }
}
