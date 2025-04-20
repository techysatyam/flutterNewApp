import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants/image_strings.dart';

class CustomAppLogo extends StatelessWidget {
  const CustomAppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppImages.add),
        const SizedBox(width: AppSizes.mediumSpace + AppSizes.smallSpace),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.appLogoTitle, style: Theme.of(context).textTheme.headlineMedium,),
            Text(AppStrings.appLogoDesc, style: Theme.of(context).textTheme.labelMedium,),
          ],
        )
      ],
    );
  }
}
