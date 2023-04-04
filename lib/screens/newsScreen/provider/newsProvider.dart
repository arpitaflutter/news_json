import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_json/screens/newsScreen/model/newsModel.dart';

class newsProvider extends ChangeNotifier
{

  newsModel? newsModal;
  Future<void> jsonFactory()
  async {
    var newsJson = await rootBundle.loadString("assets/json/news.json");

    var newsdata = jsonDecode(newsJson);

    newsModal = newsModel().newsFromJson(newsdata);
    notifyListeners();
  }
}