import 'package:equatable/equatable.dart';

class WebRouterPath extends Equatable {
  final Uri uri;
  final int? worksId;
  WebRouterPath._(String path, this.worksId) : uri = Uri(path: path);

  WebRouterPath.index() : this._('/',null);
  WebRouterPath.signIn() : this._('/signIn',null);
  WebRouterPath.works() : this._('/works',null);
  WebRouterPath.worksDetail(int? id) : this._('/works/$id',id);
  WebRouterPath.unKnown() : this._('/unknown',null);
  @override
  List<Object?> get props => [uri.path];

  // int? urlLength;
  // String? urlBaseName;
  // int? worksId;
  // WebRouterPath.index()
  //     : urlLength = 0,
  //       urlBaseName = null,
  //       worksId = null;
  // WebRouterPath.sign()
  //     : urlLength = 1,
  //       urlBaseName = 'signIn',
  //       worksId = null;
  // WebRouterPath.worksIndex()
  //     : urlLength = 1,
  //       urlBaseName = 'works',
  //       worksId = null;
  // WebRouterPath.worksDetial(this.worksId)
  //     : urlLength = 2,
  //       urlBaseName = "works";
  // WebRouterPath.unKnown()
  //     : urlLength = 1,
  //       urlBaseName = 'unKnown',
  //       worksId = null;

  // bool get isIndex => urlLength == 0 && urlBaseName == null && worksId == null;
  // bool get isSign =>
  //     urlLength == 1 && urlBaseName == 'signIn' && worksId == null;
  // bool get isWorksIndex =>
  //     urlLength == 1 && urlBaseName == 'works' && worksId == null;
  // bool get isWorksDetail =>
  //     urlLength == 2 && urlBaseName == 'works' && worksId != null;
  // bool get isUnknown => urlLength == 1 && urlBaseName == 'error';
}
