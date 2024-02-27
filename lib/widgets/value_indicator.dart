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

            int flex1 = 0;
            int flex2 = 0;

            if (isUpperBound) {
              flex1 = testRanges[index].getRangeLength();
              flex2 = (index < testRanges.length - 1
                  ? testRanges[index + 1].getRangeLength()
                  : 0);
            } else {
              flex1 = (index > 0 ? testRanges[index - 1].getRangeLength() : 0);
              flex2 = testRanges[index].getRangeLength();
            }

            int flexs = flex1 + flex2;

            return testRanges.indexOf(e) % 2 == 0
                ? Expanded(
                    flex: flexs,
                    child: Row(
                      children: [
                        Expanded(
                          flex: flex1,
                          child: Container(),
                        ),
                        Text(
                          isUpperBound
                              ? e.upperBound.toString()
                              : value != e.lowerBound
                                  ? e.lowerBound.toString()
                                  : '',
                          style: AppStyles.boldTextStyle,
                        ),
                        Expanded(
                          flex: flex2,
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
