import 'package:flutter/material.dart';
import 'package:flutter_app/provider/networkHelper.dart';

class ESPN extends StatefulWidget {
  final dynamic Function() getData;

  const ESPN({Key key, this.getData}) : super(key: key);
  @override
  _ESPNState createState() => _ESPNState();
}

class _ESPNState extends State<ESPN> {
  dynamic data = [];
  List articles;
  fetchData() async {
    data = await NetworkHelper.getESPNNews();
    if (data != null) {
      if (mounted) {
        setState(() {
          articles = data['articles'];
        });
      }
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return articles != null
        ? ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 7),
                elevation: 2,
                borderOnForeground: true,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 7.0),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        child: Image.network(
                          articles[index]['urlToImage'],
                          fit: BoxFit.cover,
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
                        margin: EdgeInsets.only(bottom: 3, right: 5),
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
            },
          )
        : Center(child: CircularProgressIndicator());
  }
}
