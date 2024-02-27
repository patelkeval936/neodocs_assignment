import 'package:flutter/material.dart';
import 'package:neodocs_assignment/providers/test_data_provider.dart';
import 'package:neodocs_assignment/screens/home_screen.dart';
import 'package:neodocs_assignment/utils/constants.dart';
import 'package:neodocs_assignment/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<TestDataProvider>(
          create: (BuildContext context) => TestDataProvider(),
          child: const HomeScreen()),
    );
  }
}
