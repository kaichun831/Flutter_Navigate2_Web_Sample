import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaichun_profile/model/Work.dart';
import 'package:kaichun_profile/router/WebRouterPath.dart';
import 'package:kaichun_profile/screen/ErrorScreen.dart';
import 'package:kaichun_profile/screen/IndexScreen.dart';
import 'package:kaichun_profile/screen/LoginScreen.dart';
import 'package:kaichun_profile/screen/WorksDetialScreen.dart';
import 'package:kaichun_profile/screen/WorksIndexScreen.dart';

List<Work> works = [Work.text()];

class WebRouterDelegate extends RouterDelegate<WebRouterPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<WebRouterPath> {
  WebRouterPath _currentConfiguration =WebRouterPath.works();
  @override
  WebRouterPath? get currentConfiguration => _currentConfiguration;

  void goHome() {
    _currentConfiguration = WebRouterPath.index();
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _routerPage(),
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(WebRouterPath path) async {
    _currentConfiguration = path;
    return;
  }

  List<Page> _routerPage() {
    return [
      if (_currentConfiguration == WebRouterPath.index())
        MaterialPage(child: IndexScreen()),
      if (_currentConfiguration == WebRouterPath.signIn())
        MaterialPage(child: LoginScreen()),
      if (_currentConfiguration == WebRouterPath.works())
        MaterialPage(child: WorksIndexScreen()),
      if (_currentConfiguration ==
          WebRouterPath.worksDetail(_currentConfiguration.worksId))
        MaterialPage(
            child: WorksDetialScreen(
                work: works.elementAt(_currentConfiguration.worksId! - 1))),
      if (_currentConfiguration == WebRouterPath.unKnown())
        MaterialPage(child: ErrorScreen())
    ];
  }
}
