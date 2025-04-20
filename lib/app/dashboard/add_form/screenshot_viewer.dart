import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../common/utils/constants/colors.dart';
import '../bloc/dashboard_bloc.dart';

class ScreenshotViewer extends StatelessWidget {
  final List<ScreenshotFile> screenshots;
  final VoidCallback onAddScreenshot;
  final void Function(int index) onRemoveScreenshot;
  final double cardWidth;
  final double cardHeight;
  final String? label;
  final String? subText;

  const ScreenshotViewer(
      {super.key,
      required this.screenshots,
      required this.onAddScreenshot,
      required this.onRemoveScreenshot,
      this.cardWidth = 70,
      this.cardHeight = 120,
      this.label,
      this.subText});

  @override
  Widget build(BuildContext context) {
    final canAddMore = screenshots.length < 5;
    final totalItems = canAddMore ? screenshots.length + 1 : 5;

    return Column(
      children: [
        Row(
          children: [
            Text(
              label!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.headingTextColor,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  subText!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.hintTextColor,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(totalItems, (index) {
            if (index < screenshots.length) {
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  _buildScreenshotCard(screenshots[index].base64),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => onRemoveScreenshot(index),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black54,
                        ),
                        padding: const EdgeInsets.all(2),
                        child: const Icon(Icons.close,
                            size: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return _buildAddButton(context);
            }
          }),
        ),
      ],
    );
  }

  Widget _buildScreenshotCard(String base64Image) {
    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: MemoryImage(base64Decode(base64Image)),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return GestureDetector(
      onTap: onAddScreenshot,
      child: Container(
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200],
        ),
        child: const Icon(Icons.add, size: 30, color: Colors.black54),
      ),
    );
  }
}
