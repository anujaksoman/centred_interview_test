import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetails extends StatelessWidget {
  ImageDetails({
    Key? key,
    required this.image,}) : super(key: key);
  String? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.close),
            color: Colors.black,
            iconSize: 24,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Container(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.only(bottom: 60),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: PhotoView(
              imageProvider: NetworkImage("$image"),
              backgroundDecoration: BoxDecoration(color: Colors.white),
              initialScale: PhotoViewComputedScale.contained,

              maxScale: PhotoViewComputedScale.contained * 5.0,
              minScale: PhotoViewComputedScale.contained * 1.0,
              //imageProvider:  CachedNetworkImageProvider("$imgOriginalPath${image}"),
            ),
          )
      ),
    );
  }
}
