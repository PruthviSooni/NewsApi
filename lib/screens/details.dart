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
  bool _isLoading = false;
  @override
  void initState() {
    _isLoading = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString()),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            onWebViewCreated: (WebViewController webController) {
              _completer.complete(webController);
            },
            onPageFinished: (_) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container()
        ],
      ),
    );
  }
}
