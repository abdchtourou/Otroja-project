import 'package:flutter/material.dart';

class CardPositionIndicator extends StatelessWidget {
  final int totalCards;
  final int currentPosition;

  const CardPositionIndicator({
    Key? key,
    required this.totalCards,
    required this.currentPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double indicatorWidth = (width - (totalCards - 1) * 4) / totalCards; // Space between indicators

        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(totalCards, (index) {
            bool isActive = index <= currentPosition;
            return Container(
              width: indicatorWidth,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              height: 10,
              decoration: BoxDecoration(
                color: isActive ? Color(0xFF85313C) : Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            );
          }),
        );
      },
    );
  }
}
