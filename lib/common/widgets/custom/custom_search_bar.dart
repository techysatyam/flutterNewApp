import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? searchController;
  final VoidCallback? onClearSearchText;

  const CustomSearchBar({
    super.key,
    this.searchController,
    this.onClearSearchText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: TextField(
          controller: searchController,
          onChanged: (value) {
            // Optional: trigger search as you type or debounce
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.lightPrimaryColor.withOpacity(0.1),
            hintText: 'Search Apps',
            hintStyle: TextStyle(
              color: AppColors.lightPrimaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 14
            ),
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            prefixIcon: Icon(Icons.search,
                color: AppColors.lightPrimaryColor, size: 24),
            suffixIcon: (searchController?.text.isNotEmpty ?? false)
                ? IconButton(
                    icon: Icon(Icons.clear, color: AppColors.lightPrimaryColor),
                    onPressed: onClearSearchText,
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
