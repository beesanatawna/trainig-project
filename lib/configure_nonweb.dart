import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void setUrlStrategy(UrlStrategy? strategy) {
  JsUrlStrategy? jsUrlStrategy;
  if (strategy != null) {
    jsUrlStrategy = convertToJsUrlStrategy(strategy);
  }
  jsSetUrlStrategy(jsUrlStrategy);
}

void configureApp() {
  setUrlStrategy(PathUrlStrategy());
}
