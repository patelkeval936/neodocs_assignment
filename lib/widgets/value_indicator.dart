import 'package:flutter/material.dart';
import 'package:neodocs_assignment/models/test_reference_info.dart';
import 'package:neodocs_assignment/utils/app_styles.dart';

class ValueIndicators extends StatelessWidget {
  const ValueIndicators({
    super.key,
    required this.testRanges,
    required this.value,
    required this.isUpperBound,
  });

  final List<TestReferenceInfo> testRanges;
  final double? value;
  final bool isUpperBound;

  int getFlex1(int index) {
    if (isUpperBound) {
      return testRanges[index].getRangeLength();
    } else {
      return (index > 0 ? testRanges[index - 1].getRangeLength() : 0);
    }
  }

  int getFlex2(int index) {
    if (isUpperBound) {
      return (index < testRanges.length - 1
          ? testRanges[index + 1].getRangeLength()
          : 0);
    } else {
      return testRanges[index].getRangeLength();
    }
  }

  int getTotalFlex(int index) {
    return getFlex1(index) + getFlex2(index);
  }

  String getValueText( TestReferenceInfo info){
    return isUpperBound
        ? info.upperBound.toString()
        : value != info.lowerBound
        ? info.lowerBound.toString()
        : '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ...testRanges.map((e) {
            int index = testRanges.indexOf(e);

            return testRanges.indexOf(e) % 2 == 0
                ? Expanded(
                    flex: getTotalFlex(index),
                    child: Row(
                      children: [
                        Expanded(
                          flex: getFlex1(index),
                          child: Container(),
                        ),
                        Text(
                         getValueText(e),
                          style: AppStyles.boldTextStyle,
                        ),
                        Expanded(
                          flex: getFlex2(index),
                          child: Container(),
                        ),
                      ],
                    ),
                  )
                : Container();
          }).toList()
        ],
      ),
    );
  }
}
