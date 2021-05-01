import 'package:flutter/cupertino.dart';
import 'WebRouterPath.dart';

class WebRouteInformationParser extends RouteInformationParser<WebRouterPath> {
  @override
  Future<WebRouterPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse('${routeInformation.location}'); //實際網址
    final pathSegments = uri.pathSegments; //後面屬性
    final pathSegmentsCount = uri.pathSegments.length;

    //  Handle '/'
    if (pathSegmentsCount == 0) return WebRouterPath.index();
    if (pathSegmentsCount == 1) {
      //  Handle '/signIn'
      if (pathSegments.first == 'signIn') return WebRouterPath.signIn();
      //  Handle '/works'
      if (pathSegments.first == 'works') return WebRouterPath.works();
      return WebRouterPath.unKnown();
    }
    //  Handle '/works/:workId'
    if (pathSegmentsCount == 2) {
      int? worksId = int.tryParse(pathSegments.elementAt(1));
      return WebRouterPath.worksDetail(worksId!);
    }
    return WebRouterPath.unKnown();
  }

  @override
  RouteInformation? restoreRouteInformation(WebRouterPath path) {
    if (path == WebRouterPath.index()) return RouteInformation(location: '/');
    if (path == WebRouterPath.signIn())
      return RouteInformation(location: '/signIn');
    if (path == WebRouterPath.works())
      return RouteInformation(location: '/works');
    if (path == WebRouterPath.worksDetail(path.worksId!))
      return RouteInformation(location: '/works/${path.worksId}');
    if (path == WebRouterPath.unKnown())
      return RouteInformation(location: '/unknown');
    return null;
  }
}
