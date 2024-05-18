import 'package:ecom/core/constants/app_color.dart';
import 'package:ecom/features/buy/presentation/pages/home/main_page.dart';
import 'package:ecom/multibloc_provider.dart';
import 'package:ecom/service_locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await setupLocators();

  runApp(const MultiBlocProviderClass(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColor.scaffoldColor,
          appBarTheme: AppBarTheme(color: AppColor.white)),
      title: 'Ecomm',
      home: MainPage(),
    );
  }
}
