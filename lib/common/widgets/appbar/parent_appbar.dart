import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../app/bloc/app_bloc.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../icons/material_circle_icon.dart';

class CustomParentAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomParentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AppBloc>();
    final isDarkMode = bloc.state.themeMode == ThemeMode.dark;

    return Row(
      children: [
        const SizedBox(width: 16),

        /// Search Container
        Expanded(
          child: Container(
            height: 40,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.grey),
                const SizedBox(width: 8),
                Text("Search", style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ),

        const Spacer(),

        /// Theme Switch Button with Animation
        MaterialCircleIcon(
          circleColor: AppColors.dividerColor(context),
          innerPadding: const EdgeInsets.all(AppSizes.mediumSpace),
          onTap: () {
            bloc.add(AppEvent.switchDarkMode(isDarkMode: isDarkMode));
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return RotationTransition(
                turns: animation,
                child: ScaleTransition(scale: animation, child: child),
              );
            },
            child: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode_outlined,
              key: ValueKey<bool>(isDarkMode), // Important for AnimatedSwitcher
              color: AppColors.primaryGradient1(context),
            ),
          ),
        ),

        const SizedBox(width: AppSizes.mediumSpace),

        /// Notification Icon
        MaterialCircleIcon(
          innerPadding: const EdgeInsets.all(AppSizes.mediumSpace),
          onTap: () {},
          circleColor: AppColors.dividerColor(context),
          child: SvgPicture.asset(
            AppImages.backArrow,
            colorFilter:
                ColorFilter.mode(AppColors.iconColor(context), BlendMode.srcIn),
          ),
        ),

        const SizedBox(width: AppSizes.mediumSpace),

        /// Profile Icon
        MaterialCircleIcon(
          innerPadding: const EdgeInsets.all(AppSizes.mediumSpace),
          onTap: () {},
          circleColor: AppColors.dividerColor(context),
          child: const Icon(Icons.person),
        ),

        const SizedBox(width: AppSizes.defaultSpace),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
