import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../pages/categoryNews.dart';

class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName, rssUrl;

  CategoryCard({this.imageAssetUrl, this.categoryName, this.rssUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String newsSite;

        if (rssUrl.contains("t24")) {
          newsSite = "T24";
        } else if (rssUrl.contains("sabah")) {
          newsSite = "Sabah";
        } else {
          newsSite = "Haber Türk";
        }
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => NewsPage(
                    newsSite: newsSite,
                    rssUrl: rssUrl,
                    newsType: categoryName,
                  )),
          ModalRoute.withName('/'),
        );
      },
      child: Card(
        margin: EdgeInsets.only(right: 14),
        elevation: 5,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: imageAssetUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w800),
              ),
            )
          ],
        ),
      ),
    );
  }
}