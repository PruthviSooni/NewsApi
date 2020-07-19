import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget {
  final List articles;
  final dynamic index;

  const CardTemplate({Key key, this.articles, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 7),
      elevation: 2,
      borderOnForeground: true,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7.0),
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                articles[index]['urlToImage'],
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
                width: 100,
              ),
            ),
            Text(
              articles[index]['title'],
              softWrap: true,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
