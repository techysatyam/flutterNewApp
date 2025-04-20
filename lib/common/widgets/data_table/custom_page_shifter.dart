import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/constants/colors.dart';
import '../text_field/custom_text_field.dart';

class CustomPageShifter extends StatelessWidget {
  const CustomPageShifter(
      {super.key,
      required this.onBackPressed,
      required this.onForwardPressed,
      this.startPage,
      this.endPage,
      this.page,
      this.totalPage,
      required this.canBack,
      required this.canForward,
      this.onSearchPage,
      this.searchTextController});

  final Function() onBackPressed, onForwardPressed;
  final Function()? startPage, endPage;
  final dynamic Function(String)? onSearchPage;
  final TextEditingController? searchTextController;
  final bool canBack, canForward;
  final int? page;
  final int? totalPage;

  final double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        alignment: WrapAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Jump to text
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Jump to page:',
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 32,
                    width: 55,
                    child: CustomTextField.outlineBorder(
                      controller: searchTextController,
                      onChanged: onSearchPage,
                      hintText: '$page',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      textInputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),

              // page no. text
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$page',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.shadow),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'of',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.shadow),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '$totalPage',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.shadow),
                  ),
                ],
              ),

              // Icons
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: iconSize,
                    onPressed: startPage,
                    icon: Icon(
                      Icons.skip_previous_rounded,
                      color: canBack
                          ? AppColors.textColor(context)
                          : Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    iconSize: iconSize,
                    onPressed: onBackPressed,
                    icon: Icon(
                      Icons.navigate_before_rounded,
                      color: canBack
                          ? AppColors.textColor(context)
                          : Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(width: 5),
                  // Text(
                  //   '$page',
                  //   style: TextStyle(color: Theme.of(context).colorScheme.shadow),
                  // ),
                  const SizedBox(width: 5),
                  IconButton(
                    iconSize: iconSize,
                    onPressed: onForwardPressed,
                    icon: Icon(
                      Icons.navigate_next_rounded,
                      color: canForward
                          ? AppColors.textColor(context)
                          : Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    iconSize: iconSize,
                    onPressed: endPage,
                    icon: Icon(
                      Icons.skip_next_rounded,
                      color: canForward
                          ? AppColors.textColor(context)
                          : Colors.grey.shade400,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
