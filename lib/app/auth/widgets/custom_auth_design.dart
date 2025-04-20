
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/image_strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/utils/constants/sizes.dart';
import '../../../common/utils/helpers/helper_functions.dart';

class CustomAuthDesign extends StatelessWidget {
  const CustomAuthDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AppImages.add, fit: BoxFit.cover),
        Positioned(
          bottom: AppHelperFunctions.screenHeight(context) / 5,
          right: 0,
          left: 0,
          child: Text(AppLocalizations.of(context)!.hassleFreeBillPayments,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: AppColors.lightBgColor, fontSize: AppSizes.fontSizeXL)),
        ),
        Positioned(
          bottom: AppHelperFunctions.screenHeight(context) / 8,
          right: 0,
          left: 0,
          child: Text(AppLocalizations.of(context)!.hassleFreeBharatBillPayments,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.lightBgColor)),
        )
      ],
    );
  }
}
