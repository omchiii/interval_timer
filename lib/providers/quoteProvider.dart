import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

class QuoteProvider extends ChangeNotifier {
  String quote = "Loading...";
  Future<http.Response> fetchQuote() {
    http.get('https://pastebin.com/raw/jmhKjPLD').then((value) {
      quote = value.body;
      notifyListeners();
    });
  }
}
