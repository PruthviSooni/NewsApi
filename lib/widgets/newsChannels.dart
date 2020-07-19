import 'package:flutter/material.dart';
import 'package:flutter_app/screens/details.dart';

import 'cardTemplate.dart';

class NewsChannels extends StatelessWidget {
  const NewsChannels({
    Key key,
    @required this.articles,
  }) : super(key: key);

  final List articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Detail(
                      url: articles[index]['url'],
                      title: articles[index]['source']['name'],
                    )));
          },
          child: CardTemplate(
            articles: articles,
            index: index,
          ),
        );
      },
    );
  }
}
