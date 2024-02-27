import 'package:flutter/material.dart';

import '../models/test_metadata.dart';
import '../models/test_reference_info.dart';

class TestDataRepository {
  static TestMetaData getTestMetaData() {
    return TestMetaData([
      TestReferenceInfo(
          lowerBound: 0,
          upperBound: 30,
          color: Colors.red,
          meaning: "Dangerous"),
      TestReferenceInfo(
          lowerBound: 30,
          upperBound: 40,
          color: Colors.orange,
          meaning: "Moderate"),
      TestReferenceInfo(
          lowerBound: 40,
          upperBound: 60,
          color: Colors.green,
          meaning: "Ideal"),
      TestReferenceInfo(
          lowerBound: 60,
          upperBound: 70,
          color: Colors.orange,
          meaning: "Moderate"),
      TestReferenceInfo(
          lowerBound: 70,
          upperBound: 120,
          color: Colors.red,
          meaning: "Dangerous"),
    ]);
  }
}
