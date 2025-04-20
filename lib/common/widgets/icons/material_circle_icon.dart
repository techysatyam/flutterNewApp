import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class MaterialCircleIcon extends StatelessWidget {
  const MaterialCircleIcon({
    super.key,
    this.onTap,
    this.circleColor = Colors.transparent,
    this.circleHeight = 55,
    this.circleWidth = 55,
    this.innerPadding = const EdgeInsets.all(14),
    this.iconColor,
    required this.child,
  });

  final EdgeInsetsGeometry innerPadding;
  final VoidCallback? onTap;
  final double circleHeight, circleWidth;
  final Color circleColor;
  final Color? iconColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      // shape: const CircleBorder(),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        customBorder: const CircleBorder(), // Ensures ripple is circular
        child: Padding(
            padding: const EdgeInsets.all(AppSizes.smallSpace),
            child: CircleAvatar(backgroundColor: circleColor, child: child)),
      ),
    );
  }
}
