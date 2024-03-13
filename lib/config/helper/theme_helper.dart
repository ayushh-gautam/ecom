// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import '../../core/constants/app_color.dart';
// import '../../core/constants/app_constants.dart';
// import '../utils/hex_color.dart';

// class AppTheme {
//   static String darkTheme = APP_THEME_DARK;
//   static String lightTheme = APP_THEME_LIGHT;
// }

// class ThemeHelper {
//   // ignore: non_constant_identifier_names
//   static String CURRENT_THEME = "";
//   Color defaultLightTextColor = const Color(0xFF222222);
//   Color defaultDarkTextColor = const Color(0xFFF7F7F7);
//   static ThemeData? _currentAppThemeData;

//   ThemeData? getAppTheme(BuildContext context) {
//     return _currentAppThemeData;
//   }

//   getStatusBar(context, {color}) {
//     return const SystemUiOverlayStyle().copyWith(
//       statusBarColor: color ??
//           Theme.of(context).appBarTheme.backgroundColor, //top bar color
//       statusBarIconBrightness: Theme.of(context)
//           .appBarTheme
//           .systemOverlayStyle
//           ?.statusBarBrightness, //top bar icons
//       systemNavigationBarColor: color ??
//           Theme.of(context).appBarTheme.backgroundColor, //bottom bar color
//       systemNavigationBarIconBrightness: Theme.of(context)
//                   .appBarTheme
//                   .systemOverlayStyle
//                   ?.statusBarBrightness ==
//               Brightness.light
//           ? Brightness.dark
//           : Brightness.light,
//     );
//   }

//   static var mySystemTheme = SystemUiOverlayStyle.light.copyWith(
//     statusBarColor: Colors.white, //top bar color
//     statusBarIconBrightness: Brightness.dark, //top bar icons
//     systemNavigationBarColor: Colors.white, //bottom bar color
//     systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
//   );

//   ThemeData generateApptheme(
//     BuildContext context,
//      AppThemeState selectedTheme,
//   ) {
//     CURRENT_THEME = selectedTheme.name;
//     if (selectedTheme.name == APP_THEME_LIGHT) {
//       _currentAppThemeData = ThemeData(
//           scaffoldBackgroundColor: AppColor.scaffoldColor,
//           appBarTheme: AppBarTheme(
//               backgroundColor: AppColor
//                   .primaryColor)); // define all theme color here -> (light theme)
//     } else {
//       _currentAppThemeData = ThemeData(scaffoldBackgroundColor: AppColor.black);
//     }

//     return _currentAppThemeData!;
//   }

//   getSilverAppBarColor() {
//     if (CURRENT_THEME == APP_THEME_LIGHT) {
//       return Colors.white;
//     } else {
//       return Color(HexColor.getColorFromHex("#292929"));
//     }
//   }
// }
