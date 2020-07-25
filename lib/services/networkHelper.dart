import 'dart:convert';

import 'package:flutter_app/configs/key.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  static final baseUrl = 'https://newsapi.org/v2/everything';
  static String theHindu = '$baseUrl?domains=thehindu.com&apiKey=${APIKey.key}';
  static String timesofindia =
      '$baseUrl?domains=indiatimes.com&apiKey=${APIKey.key}';
  static String bbc = '$baseUrl?domains=bbc.co.uk&apiKey=${APIKey.key}';
  static String espn = '$baseUrl?domains=espn.com&apiKey=${APIKey.key}';
  static String foxnews = '$baseUrl?domains=foxnews.com&apiKey=${APIKey.key}';
  static String timeNews = '$baseUrl?domains=time.com&apiKey=${APIKey.key}';

  static getNews(url) async {
    Map data;
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      print(response.statusCode);
    }
  }
}
