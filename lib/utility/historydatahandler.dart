import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:t20_worldcup/models/historymodel.dart';

class HistoryDataHandler{
  static Future<List<HistoryModel>> getAllHistory(context) async {
    var histories = <HistoryModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data);
    var historyData = jsonData['history'];
    for(var history in historyData){
      HistoryModel historyModel = HistoryModel.fromjson(history);
      histories.add(historyModel);
    }
    return histories;

  }
} 