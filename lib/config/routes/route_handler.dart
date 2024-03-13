// import 'package:flutter/material.dart';

// import '../../features/login/presentation/pages/login_page.dart';
// import '../../features/login/presentation/pages/splash_screen.dart';
// import '../../core/constants/app_color.dart';
// import 'global_key.dart';
// import 'route.dart';

// var defaultRoute = Routes.splashScreen;
// // var activeRoute = null;
// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case Routes.index:
//       return generateRoute(RouteSettings(name: defaultRoute));
//     // return _getPageRoute(
//     //     routeName: settings.name!,
//     //     screen: CommomBodyWidget(screenName: settings.name!),); //
//     case Routes.splashScreen:
//       return _getPageRoute(
//         routeName: settings.name!,
//         screen: const SplashScreen(),
//       ); //

//     case Routes.loginPage:
//       return _getPageRoute(routeName: settings.name!, screen: LoginPage());


//     default:
//       return MaterialPageRoute(
//         builder: (_) => Scaffold(
//           backgroundColor: AppColor.scaffoldColor,
//           body: Center(
//             child: Text('Opps!! no Route found ${settings.name}'),
//           ),
//         ),
//       );
//   }
// }

// void navigate(String routeName, {dynamic routeArgs}) {
//   gNavigator?.pushNamed(routeName, arguments: routeArgs);
// }

// enum PageTransitionType {
//   fade,
//   rightToLeft,
//   leftToRight,
//   upToDown,
//   downToUp,
//   scale,
//   rotate,
//   size,
//   rightToLeftWithFade,
//   leftToRightWithFade,
// }

// PageRoute _getPageRoute({
//   required String routeName,
//   required Widget screen,
// }) {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => screen,
//     settings: RouteSettings(name: routeName),
//     fullscreenDialog: false,
//     transitionDuration: Duration.zero,
//     reverseTransitionDuration: Duration.zero,
//   );

//   // return PageTransition(
//   //   child: screen,
//   //   type: PageTransitionType.fade,
//   // );
// }

// class PageTransition extends PageRouteBuilder {
//   final Widget child;
//   final PageTransitionType type;
//   final Curve curve;
//   final Alignment alignment;
//   final Duration duration;

//   PageTransition({
//     required this.child,
//     this.type = PageTransitionType.rightToLeft,
//     this.curve = Curves.linear,
//     this.alignment = Alignment.center,
//     this.duration = const Duration(milliseconds: 300),
//   }) : super(
//           pageBuilder: (BuildContext context, Animation<double> animation,
//               Animation<double> secondaryAnimation) {
//             return child;
//           },
//           transitionDuration: duration,
//           transitionsBuilder: (BuildContext context,
//               Animation<double> animation,
//               Animation<double> secondaryAnimation,
//               Widget child) {
//             switch (type) {
//               case PageTransitionType.fade:
//                 return FadeTransition(
//                   opacity: animation,
//                   child: child,
//                 );
//               case PageTransitionType.rightToLeft:
//                 return SlideTransition(
//                   transformHitTests: false,
//                   position: Tween<Offset>(
//                     begin: const Offset(1.0, 0.0),
//                     end: Offset.zero,
//                   ).animate(animation),
//                   child: SlideTransition(
//                     position: Tween<Offset>(
//                       begin: Offset.zero,
//                       end: const Offset(-1.0, 0.0),
//                     ).animate(secondaryAnimation),
//                     child: child,
//                   ),
//                 );

//               case PageTransitionType.downToUp:
//                 return SlideTransition(
//                   transformHitTests: false,
//                   position: Tween<Offset>(
//                     begin: const Offset(0.0, 1.0),
//                     end: Offset.zero,
//                   ).animate(animation),
//                   child: SlideTransition(
//                     position: Tween<Offset>(
//                       begin: Offset.zero,
//                       end: const Offset(0.0, -1.0),
//                     ).animate(secondaryAnimation),
//                     child: child,
//                   ),
//                 );

//               case PageTransitionType.rightToLeftWithFade:
//                 return SlideTransition(
//                   position: Tween<Offset>(
//                     begin: const Offset(1.0, 0.0),
//                     end: Offset.zero,
//                   ).animate(animation),
//                   child: FadeTransition(
//                     opacity: animation,
//                     child: SlideTransition(
//                       position: Tween<Offset>(
//                         begin: Offset.zero,
//                         end: const Offset(-1.0, 0.0),
//                       ).animate(secondaryAnimation),
//                       child: child,
//                     ),
//                   ),
//                 );

//               default:
//                 return FadeTransition(opacity: animation, child: child);
//             }
//           },
//         );
// }
