import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Detail extends StatefulWidget {
  final String url;
  final String title;

  const Detail({Key key, this.url, this.title}) : super(key: key);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString()),
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
        onWebViewCreated: (WebViewController webController) {
          _completer.complete(webController);
        },
      ),
    );
  }
}
