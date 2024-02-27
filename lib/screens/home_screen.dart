import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neodocs_assignment/utils/app_styles.dart';
import 'package:neodocs_assignment/utils/validators.dart';
import 'package:neodocs_assignment/providers/test_data_provider.dart';
import 'package:neodocs_assignment/utils/constants.dart';
import 'package:neodocs_assignment/widgets/bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController testValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppConstants.appName),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
        child: Column(
          children: [

            Selector<TestDataProvider, double?>(
              selector: (context, testProvider) {
                return testProvider.testValue;
              },
              builder: (BuildContext context, value, Widget? child) {
                return Bar(
                  testRanges: context.read<TestDataProvider>().testRangeList,
                  value: value,
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Form(
                      key: context.read<TestDataProvider>().formKey,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        controller: testValueController,
                        cursorColor: Colors.black54,
                        validator: (value) {
                          return Validators.testValueValidator(
                              value,
                              context.read<TestDataProvider>().getLowerBound,
                              context.read<TestDataProvider>().getUpperBound
                          );
                        },
                        onTapOutside: (event){
                          FocusScope.of(context).unfocus();
                        },
                        decoration: AppStyles.textFieldDecoration,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: IconButton(
                      iconSize: 34,
                      onPressed: () {
                        context.read<TestDataProvider>()
                            .setTestValue(testValueController.text);
                      },
                      icon: const Icon(Icons.arrow_circle_right_outlined),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
