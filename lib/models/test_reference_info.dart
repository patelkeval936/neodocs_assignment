import 'dart:ui';

class TestReferenceInfo {
  final int lowerBound;
  final int upperBound;
  final Color color;
  final String meaning;

  TestReferenceInfo({
    required this.lowerBound,
    required this.upperBound,
    required this.color,
    required this.meaning});

  int getRangeLength() {
    return upperBound - lowerBound;
  }

}