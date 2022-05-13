
import 'package:cached_network_image/cached_network_image.dart';
import 'package:centered_interview_test/model/hit_model.dart';
import 'package:flutter/material.dart';

class ImageRow extends StatefulWidget {
  ImageRow({
    Key? key,
    required this.imageData,}) : super(key: key);
  Hits imageData;
  @override
  _ImageRowState createState() => _ImageRowState();
}

class _ImageRowState extends State<ImageRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
           // color: Colors.red,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 10,
                child: Container(
                  //color: Colors.brown,
                  height: 400,
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                  margin: EdgeInsets.only(
                      top: 10,
                      left:10,
                      right:10,
                      bottom: 10),
                  //color: Colors.green,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [BoxShadow(color: Colors.black26,spreadRadius: 1,blurRadius: 4)]
                  ),
                  child: CachedNetworkImage(
                    imageUrl: "${widget.imageData.userImageURL}",
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover),
                        ),
                      );
                    },
                    placeholder: (context, url) => Container(
                        padding: EdgeInsets.all(8),
                        child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error),
                  ),
                ),
              ),

              Flexible(
                flex: 3,
                child: Container(
                  //color: Colors.blue,
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          width: double.infinity,
                          //  color: Colors.indigo,
                          child: Container(
                            //   color: Colors.pink,
                            padding: EdgeInsets.only(
                                left: 15,right: 5),
                            child: Text(
                              'Views',
                           /*   textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,*/
                              maxLines: 2,
                              style: TextStyle(

                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                14,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Flexible(
                        flex: 2,
                        child:  Container(
                          // color: Colors.blue,
                          width: double.infinity,

                          padding: EdgeInsets.symmetric(
                              horizontal:5),
                          child: Text(
                            '${widget.imageData.views}',
                            style: TextStyle(
                                color: Colors.blueAccent,

                                fontSize: 14),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              Flexible(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          width: double.infinity,
                          //  color: Colors.indigo,
                          child: Container(
                            //   color: Colors.pink,
                            padding: EdgeInsets.only(
                                left: 15,right: 5),
                            child: Text(
                              'Likes',
                              textAlign: TextAlign.start,
                            /*  overflow: TextOverflow.ellipsis,
                              maxLines: 2,*/
                              style: TextStyle(

                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                14,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Flexible(
                        flex: 2,
                        child:  Container(
                          // color: Colors.blue,
                          width: double.infinity,

                          padding: EdgeInsets.symmetric(
                              horizontal:5),
                          child: Text(
                            '${widget.imageData.likes}',
                            style: TextStyle(
                                color: Colors.blueAccent,

                                fontSize: 14),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              Flexible(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          width: double.infinity,
                          //  color: Colors.indigo,
                          child: Container(
                            //   color: Colors.pink,
                            padding: EdgeInsets.only(
                                left: 15,right: 5),
                            child: Text(
                              'Downloads',
                              textAlign: TextAlign.start,
                              /*  overflow: TextOverflow.ellipsis,
                              maxLines: 2,*/
                              style: TextStyle(

                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                14,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Flexible(
                        flex: 2,
                        child:  Container(
                          // color: Colors.blue,
                          width: double.infinity,

                          padding: EdgeInsets.symmetric(
                              horizontal:5),
                          child: Text(
                            '${widget.imageData.downloads}',
                            style: TextStyle(
                                color: Colors.blueAccent,

                                fontSize: 14),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              Flexible(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          width: double.infinity,
                          //  color: Colors.indigo,
                          child: Container(
                            //   color: Colors.pink,
                            padding: EdgeInsets.only(
                                left: 15,right: 5),
                            child: Text(
                              'Comments',
                              textAlign: TextAlign.start,
                              /*  overflow: TextOverflow.ellipsis,
                              maxLines: 2,*/
                              style: TextStyle(

                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                14,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Flexible(
                        flex: 2,
                        child:  Container(
                          // color: Colors.blue,
                          width: double.infinity,

                          padding: EdgeInsets.symmetric(
                              horizontal:5),
                          child: Text(
                            '${widget.imageData.comments}',
                            style: TextStyle(
                                color: Colors.blueAccent,

                                fontSize: 14),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
