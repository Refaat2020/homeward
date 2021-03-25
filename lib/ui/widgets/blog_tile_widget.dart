import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BlogsTile extends StatelessWidget {
  String imgUrl, title, createdAt;
  BlogsTile(
      {@required this.imgUrl,
        @required this.title,
        @required this.createdAt,
       });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height: 150,
      child: Stack(
        children: <Widget>[
          ///for image
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 170,
            decoration: BoxDecoration(
                color: Colors.black45.withOpacity(0.3),
                borderRadius: BorderRadius.circular(6)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ///for title
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.white),
                ),
                SizedBox(
                  height: 4,
                ),
                ///for time
                Text(
                  createdAt,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400,color: Colors.white),
                ),
                SizedBox(
                  height: 4,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}