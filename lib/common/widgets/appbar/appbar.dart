import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/device/device_utility.dart';
import '../../utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../icons/material_circle_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.subTitle,
    this.leadingSvgLogo,
    this.showBackArrow = false,
    this.showBharatConnectLogo = false,
  });

  final String? title;
  final String? subTitle;
  final bool showBackArrow;
  final String? leadingSvgLogo;
  final bool showBharatConnectLogo;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return IntrinsicHeight(
      child: Row(
        children: [
          if (leadingSvgLogo != null) SvgPicture.asset(leadingSvgLogo!),
          if (title != null && subTitle != null) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title!, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: AppSizes.smallSpace),
                Text(
                  subTitle!,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: AppColors.paragraphColor(context)),
                )
              ],
            ),
            const Spacer(),
          ],
          if (showBackArrow) ...[
            const Spacer(),
            MaterialCircleIcon(
              innerPadding: const EdgeInsets.all(AppSizes.mediumSpace),
              onTap: () {
                Navigator.pop(context);
              },
              circleColor: AppColors.dividerColor(context),
              child: SvgPicture.asset(AppImages.backArrow),
            ),
          ],
          if (showBackArrow && showBharatConnectLogo) ...[
            const SizedBox(width: AppSizes.spaceBtwItems),
            VerticalDivider(
              color: Theme.of(context).disabledColor,
              width: 1,
              indent: AppSizes.xs * 3,
              endIndent: AppSizes.xs * 3,
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
          ],
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
