import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:t20_worldcup/models/teamsmodel.dart';

class TeamsDataHandler {
  static Future<List<TeamsModel>> getAllTeams(context) async {
    var teams = <TeamsModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data);
    var teamsdata = jsonData['teams'];
    for (var team in teamsdata) {
      TeamsModel teamsModel = TeamsModel.fromjson(team);
      teams.add(teamsModel);
    }
    return teams;
  }
}
