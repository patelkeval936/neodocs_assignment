
import 'package:flutter/material.dart';
import '../models/test_reference_info.dart';

class BarColorsIndicator extends StatelessWidget {
  const BarColorsIndicator({
    super.key,
    required this.testRanges,
    required this.barKey,
  });

  final GlobalKey barKey;
  final List<TestReferenceInfo> testRanges;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      key: barKey,
      borderRadius: BorderRadius.circular(10),
      child: Container(
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              ...testRanges
                  .map((e) => Expanded(
                flex: e.getRangeLength(),
                child: Container(
                  color: e.color,
                ),
              ))
                  .toList()
            ],
          )),
    );
  }
}