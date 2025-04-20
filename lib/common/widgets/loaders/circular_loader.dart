import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';

class CustomCircularLoader extends StatelessWidget {
  const CustomCircularLoader({
    super.key,
    this.foregroundColor = AppColors.lightPrimaryGradient1,
    this.backgroundColor = AppColors.lightSecondaryGradient1,
  });

  final Color foregroundColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: AppSizes.xl,
          height: AppSizes.xl,
          child: Image.asset(
        AppImages.customLoader,
        fit: BoxFit.contain,
    ),
    ));
    // return Container(
    //   padding: const EdgeInsets.all(AppSizes.xs),
    //   // decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
    //   // Circular background
    //   child: Center(
    //     child: CircularProgressIndicator(
    //         color: foregroundColor,
    //         backgroundColor: Colors.transparent), // Circular loader
    //   ),
    // );
  }
}
