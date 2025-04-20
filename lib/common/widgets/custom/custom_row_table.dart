
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';



class CustomRowTable extends StatelessWidget {
  final String? title;
  final String searchHint;
  final TextEditingController? searchController;
  final void Function()? filterOnTap;
  final bool? hideClearButton;
  final VoidCallback? onClearSearchText;

  const CustomRowTable({
    super.key,
     this.title,
    this.searchHint = "Search",
    this.searchController,
    this.filterOnTap,
    this.hideClearButton = true,
    this.onClearSearchText,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 400;
        return Container(
          height: 60,
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            border: Border.all(color: Colors.grey.withOpacity(0.50)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title??'',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.headingTextColor,
                  ),
                ),
              ),
              // if (filterOnTap != null)
              //   MaterialSquareIcon(
              //     onTap: filterOnTap,
              //     svgPicture: AppImages.filter,
              //     innerPadding: EdgeInsets.all(8),
              //   ),
              SizedBox(
                width: isSmallScreen ? 150 : 300,
                height: 40,
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    fillColor: AppColors.lightPrimaryColor.withOpacity(0.10),
                    filled: true,
                    prefixIcon: SizedBox(
                      width: 20,
                      height: 20,
                      child: SvgPicture.asset(
                        AppImages.searchIcon,
                        fit: BoxFit.scaleDown,
                        color: AppColors.lightPrimaryColor,
                      ),
                    ),
                    suffixIcon: hideClearButton == true
                        ? IconButton(
                            icon: Icon(
                              Icons.cancel,
                              color: AppColors.lightPrimaryColor,
                              size: isSmallScreen ? 20 : 24,
                            ),
                            onPressed: onClearSearchText)
                        : null,
                    hintText: searchHint,
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
