import 'package:flutter/material.dart';
import 'package:neodocs_assignment/models/test_reference_info.dart';
import 'package:neodocs_assignment/utils/app_styles.dart';
import 'package:neodocs_assignment/widgets/Bar_colors_indicator.dart';
import 'package:neodocs_assignment/widgets/triangle.dart';
import 'package:neodocs_assignment/widgets/value_indicator.dart';
import 'package:provider/provider.dart';
import 'package:neodocs_assignment/providers/test_data_provider.dart';

class Bar extends StatefulWidget {
  const Bar({super.key, required this.testRanges, required this.value});

  final List<TestReferenceInfo> testRanges;
  final double? value;
  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  final GlobalKey _key = GlobalKey();
  RenderBox? renderBox;
  Offset position = Offset.zero;
  double progressBarWidth = 0;

  void getBarWidth() {
    RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    progressBarWidth = renderBox.size.width;
  }

  double? getArrowIndicatorPosition(BuildContext context) {
    TestDataProvider testDataProvider = context.read<TestDataProvider>();
    double lowerBound = testDataProvider.getLowerBound.toDouble();
    double upperBound = testDataProvider.getUpperBound.toDouble();

    double? value = testDataProvider.testValue;

    if (value != null) {
      double range = upperBound - lowerBound;
      double position = (value / range) * progressBarWidth;
      return position - 15;
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getBarWidth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            ValueIndicators(
              testRanges: widget.testRanges,
              value: widget.value,
              isUpperBound: true,
            ),
            BarColorsIndicator(barKey: _key, testRanges: widget.testRanges),
            ValueIndicators(
              testRanges: widget.testRanges,
              value: widget.value,
              isUpperBound: false,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),

        ///animated positioned value indicator arrow
        if (getArrowIndicatorPosition(context) != null)
          AnimatedPositioned(
              top: 40,
              left: getArrowIndicatorPosition(context),
              duration: const Duration(milliseconds: 800),
              child: Column(children: [
                const Triangle(),
                Text(widget.value?.toInt().toString() ?? '',
                    style: AppStyles.boldTextStyle),
              ]))
      ],
    );
  }
}
