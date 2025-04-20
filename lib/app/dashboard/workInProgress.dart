import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../common/utils/constants/image_strings.dart';
import '../../common/utils/constants/sizes.dart';


class WorkInProgressScreen extends StatelessWidget {
  const WorkInProgressScreen({super.key});

  static const route = '/progressScreen';


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Lottie.asset(
        //   AppImages.workProgress,
        //   // width: 350,
        //   height: 400,
        //   // fit: BoxFit.fill,
        // ),
        SizedBox(height: AppSizes.defaultSpace),
        Text(
          "We're still building something amazing! Stay tuned.",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, fontFamily: GoogleFonts.quattrocento().fontFamily!),
        ),
      ],
    );
  }
}
