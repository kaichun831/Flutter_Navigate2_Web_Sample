// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kaichun_profile/router/WebRouterDelegate.dart';
import 'router/WebRouteInformationParser.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Router",
      routeInformationProvider:PlatformRouteInformationProvider(
        initialRouteInformation: RouteInformation(
          location: '/',
        )
    ),
      routerDelegate: WebRouterDelegate(),
      routeInformationParser: WebRouteInformationParser(),
    );
  }
}
