import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/utils/constants/image_strings.dart';

class SplashScreen extends StatefulWidget {
  final Widget nextScreen;
  const SplashScreen({super.key, required this.nextScreen});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showNext = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        setState(() {
          _showNext = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showNext ? widget.nextScreen : _buildSplashContent();
  }

  Widget _buildSplashContent() {
    final size = MediaQuery.of(context).size;
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.6,
              child: Image.asset(
                AppImages.customLoader,
                fit: BoxFit.contain,
              ),
            ),
            const Text(
              'Welcome to Getepay App Store',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
