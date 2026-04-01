import 'package:flutter/material.dart';

class PaginationIndicator extends StatelessWidget {
  final int activeIndex;
  final int totalDots;
  final Color activeColor;
  final Color inactiveColor;

  const PaginationIndicator({
    super.key,
    required this.activeIndex,
    this.totalDots = 3,
    this.activeColor = Colors.white,
    this.inactiveColor = const Color(0x4DFFFFFF), // 30% white
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalDots, (index) {
        bool isActive = index == activeIndex;
        return Container(
          width: isActive ? 32 : 16,
          height: 4,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: isActive ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(12),
          ),
        );
      }),
    );
  }
}
