import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/image_strings.dart';

class MainScreenUser extends StatelessWidget {
  final Widget child;

  const MainScreenUser({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgMainColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Image.asset(
                    AppImages.customLoader,
                    height: 30,
                    width: 30,
                  ),
                  // const Spacer(),
                  SizedBox(width: 20,),
                  Text(
                    'Dylecto',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  // const Spacer(flex: 2), // Center heading
                ],
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16.0),
            //   child: Divider(thickness: 1, color: AppColors.darkPrimaryGradient1),
            // ),


            Expanded(
              child: child,
            ),

            Divider(color: AppColors.darkPrimaryGradient1, thickness: 0.8),

            Padding(
              padding: const EdgeInsets.only(bottom: 12, top: 6),
              child: RichText(
                text: TextSpan(
                  text: "Powered by ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightTextColor,
                  ),
                  children: [
                    TextSpan(
                      text: "TechnoGracia Corp.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
