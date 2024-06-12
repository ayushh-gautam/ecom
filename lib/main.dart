import 'package:ecom/core/constants/app_color.dart';
import 'package:ecom/features/buy/presentation/pages/home/main_page.dart';
import 'package:ecom/features/offline/presentation/cubit/offline_cubit.dart';
import 'package:ecom/multibloc_provider.dart';
import 'package:ecom/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/hive/hive_settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocators();
  await HiveSetting().init();

  runApp(const MultiBlocProviderClass(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle()); to change status bar and bottom navigation bar color
    return ScreenUtilInit(
      designSize: const Size(360, 1080),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: AppColor.scaffoldColor,
              appBarTheme: AppBarTheme(color: AppColor.white)),
          title: 'Ecomm',
          home: MainPage(),
        );
      },
    );
  }
}
