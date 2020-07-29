import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ImageViewState state, Dispatch dispatch, ViewService viewService) {
  PhotoViewScaleStateController scaleStateController;

  return Material(
      color: Theme.of(viewService.context).primaryColor.withOpacity(0.25),
      child: Stack(
        children: [
          Positioned(
            child: PhotoViewGallery.builder(
              enableRotation: state.enableRotation,
              // 允许旋转
              itemCount: state.images.length,
              pageController: state.imageController,
              onPageChanged: (index) {
                dispatch(
                  ImageViewActionCreator.setCurrentIndex(
                    {'currentIndex': index},
                  ),
                );
              },
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(state.images[index]['url']),
                  initialScale: PhotoViewComputedScale.contained * .8,
                  scaleStateController: scaleStateController,
                );
              },
            ),
          ),
          Positioned(
            //图片index显示
            top: MediaQuery.of(viewService.context).padding.top + 15,
            width: MediaQuery.of(viewService.context).size.width,
            child: Center(
              child: Text('${state.currentIndex + 1}/${state.images.length}',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
          Positioned(
            right: 10,
            top: 60,
            child: IconButton(
              icon: Icon(Icons.close, size: 30, color: Colors.white),
              onPressed: () => dispatch(ImageViewActionCreator.onGoBack()),
            ),
          ),
        ],
      ));
}
