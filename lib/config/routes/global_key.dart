import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> gNavigatorKey = GlobalKey<NavigatorState>();
final gScaffoldKey = GlobalKey<ScaffoldState>();
// for snackbar
final gScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

NavigatorState? get gNavigator => gNavigatorKey.currentState;
