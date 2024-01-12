import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecom/bindings/general_bindings.dart';
import 'package:tecom/utils/constants/colors.dart';
import 'package:tecom/utils/theme/theme.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      /// Show loader or circular progress indicator meanwhile authentication repository is deciding to show relevant screen.
      home: const Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}