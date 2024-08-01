import 'dart:js' as js;

import 'constants/route_names.dart';

void updatePageMetadata(Route route, {Map<String, String>? dynamicData}) {
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