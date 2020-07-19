import 'package:flutter/material.dart';
import 'package:flutter_app/configs/tabList.dart';
import 'package:flutter_app/screens/pages/bbcnews.dart';
import 'package:flutter_app/screens/pages/espc.dart';
import 'package:flutter_app/screens/pages/foxnews.dart';
import 'package:flutter_app/screens/pages/hackerNews.dart';
import 'package:flutter_app/screens/pages/timesofindia.dart';

import 'pages/theHindu.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Api'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: tabs.map<Widget>((tabs) {
            return Tab(
              child: Text(
                '${tabs.title}',
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BBC(),
          TOF(),
          THEHINDU(),
          ESPN(),
          FOXNEWS(),
          HACKERNEWS(),
        ],
      ),
    );
  }
}
