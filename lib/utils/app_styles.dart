import 'package:flutter/material.dart';

import 'app_strings.dart';

class AppStyles {
  static InputDecoration textFieldDecoration = InputDecoration(
      hintText: AppStrings.testValue,
      fillColor: Colors.white,
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusColor: Colors.grey,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(color: Colors.black87),
      ),
  );

  static TextStyle boldTextStyle =
      const TextStyle(fontWeight: FontWeight.w500, fontSize: 14);
}
