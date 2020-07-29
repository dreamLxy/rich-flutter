import 'package:flutter/material.dart';
import 'package:rich/router.dart';

class ImagesWrapper extends StatefulWidget {
  final List pictureList;
  final int style;
  final Function onTap;

  ImagesWrapper({Key key, this.pictureList, this.style, this.onTap})
      : super(key: key);

  @override
  _ImagesWrapperState createState() => _ImagesWrapperState();
}

class _ImagesWrapperState extends State<ImagesWrapper> {
  void onImageTap(int currentIndex, {BuildContext context}) {
    var payload = {
      'currentIndex': currentIndex,
      'images': widget.pictureList.map((item) {
        String _url = item['url'];
        item['url'] = _url.endsWith('!thumb.jpg')
            ? _url.replaceFirst('!thumb.jpg', '')
            : _url;
        return item;
      }).toList(),
      'enableRotation': false
    };
    if (widget.onTap != null) {
      widget.onTap(payload);
    } else {
      Router.push(context, Router.imageViewPage, payload);
    }
  }

  List<Widget> buildImageList(double screenWidth, {BuildContext context}) {
    var _count = widget.pictureList.length;
    return List.generate(_count > 9 ? 9 : _count, (index) {
      var item = widget.pictureList[index];
      double _width;
      if (_count == 1) {
        _width = ((screenWidth - 12) / 2);
      } else {
        _width = ((screenWidth - 12) / 3) - 2;
      }

      String _url = item['url'];
      return GestureDetector(
        onTap: () => onImageTap(index, context: context),
        child: Container(
          width: _width,
          height: _width * .7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.grey[200], width: 1),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                _url.endsWith('!thumb.jpg')
                    ? _url.replaceFirst('!thumb.jpg', '')
                    : _url,
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: _screenWidth,
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: buildImageList(_screenWidth, context: context),
        runSpacing: 3,
        spacing: 3,
      ),
    );
  }
}
