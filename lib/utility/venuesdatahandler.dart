import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:t20_worldcup/models/venuesmodel.dart';

class VenuesDataHAndler {
  static Future<List<VenuesModel>> getAllVenues(context) async {
    var venues = <VenuesModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data);
    var venuesdata = jsonData['venues'];
    for (var venue in venuesdata) {
      VenuesModel venuesModel = VenuesModel.fromjson(venue);
      venues.add(venuesModel);
    }
    return venues;
  }
}
