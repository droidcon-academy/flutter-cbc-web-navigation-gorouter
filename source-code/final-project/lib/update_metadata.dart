import 'dart:js' as js;
import 'package:go_router/go_router.dart';

import 'constants/route_names.dart';

void updatePageMetadata(GoRouterState state, Route route,
    {Map<String, String>? dynamicData}) {
  final topRoute = state.topRoute;
  if (topRoute == null || topRoute.name != route.name) {
    return;
  }

  var metadata = Map<String, String>.from(route.metadata);

  if (dynamicData != null) {
    metadata.forEach((key, value) {
      dynamicData.forEach((placeholder, realValue) {
        metadata[key] = value.replaceAll(placeholder, realValue);
      });
    });
  }

  js.context.callMethod('updateMetadata', [
    metadata['title'],
    metadata['description'],
    metadata['url'],
    metadata['image']
  ]);
}
