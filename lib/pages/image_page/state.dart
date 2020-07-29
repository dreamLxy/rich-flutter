import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class ImageViewState implements Cloneable<ImageViewState> {
  List images;
  int currentIndex = 0;
  PageController imageController;
  bool enableRotation = false;

  @override
  ImageViewState clone() {
    return ImageViewState()
..images = images
..currentIndex = currentIndex;
}
}

ImageViewState initState(Map<String, dynamic> args) {
  return ImageViewState()
    ..images = args['images']
    ..currentIndex = args['currentIndex']
    ..imageController = PageController(initialPage: args['currentIndex'])
    ..enableRotation = args['enableRotation'];
}
