import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget {
  const CardTemplate({
    Key key,
    @required this.articles,
    @required this.index,
  }) : super(key: key);

  final List articles;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
      elevation: 2,
      borderOnForeground: true,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 240,
                imageUrl: articles[index]['urlToImage'],
                placeholder: (context, url) => Image.asset(
                  'images/placeholder.png',
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 5),
              child: Text(
                articles[index]['title'],
                softWrap: true,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(bottom: 5, right: 5, top: 5),
              child: Text(
                articles[index]['publishedAt'],
                softWrap: true,
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 13.0,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
