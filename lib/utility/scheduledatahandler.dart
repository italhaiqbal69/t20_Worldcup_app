import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:t20_worldcup/models/schedulemodel.dart';

class ScheduleDataHandler {
  static Future<List<ScheduleModel>> getAllMatches(context) async {
    var matches = <ScheduleModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data);
    var scheduleData = jsonData['schedule'];
    for (var match in scheduleData) {
      ScheduleModel scheduleModel = ScheduleModel.fromjson(match);
      matches.add(scheduleModel);
    }
    return matches;
  }
}
