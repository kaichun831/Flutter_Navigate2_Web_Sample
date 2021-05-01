import 'package:flutter/material.dart';
import 'package:kaichun_profile/router/WebRouterDelegate.dart';

class WorksIndexScreen extends StatefulWidget {
  @override
  _WorksIndexScreenState createState() => _WorksIndexScreenState();
}

class _WorksIndexScreenState extends State<WorksIndexScreen> {
  @override
  Widget build(BuildContext context) {
    final delegate = Router.of(context).routerDelegate as WebRouterDelegate;
    return Scaffold(
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            delegate.goHome();
          },
          child: Text('Home'),
        ),
      ),
    );
  }
}
