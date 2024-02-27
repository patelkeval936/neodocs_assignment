import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:neodocs_assignment/models/test_metadata.dart';
import 'package:neodocs_assignment/models/test_reference_info.dart';
import 'package:neodocs_assignment/repositories/test_data_repository.dart';

class TestDataProvider extends ChangeNotifier {

  double? _testValue;

  final TestMetaData _testMetaData = TestDataRepository.getTestMetaData();

  final formKey = GlobalKey<FormState>();

  double? get testValue => _testValue;
  List<TestReferenceInfo> get testRangeList => _testMetaData.testRangesList;
  double get getLowerBound => _testMetaData.testRangesList[0].lowerBound.toDouble();
  double get getUpperBound => _testMetaData.testRangesList.last.upperBound.toDouble();

  void setTestValue(String inputValue) {
    if (formKey.currentState!.validate()) {
      double? value;
      try {
        value = double.parse(inputValue);
        _testValue = value;
      } catch (e) {
        log(e.toString());
      }
      notifyListeners();
    }
  }

}
