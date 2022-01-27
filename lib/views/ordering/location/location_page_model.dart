import 'package:bitapp/core/services/api/delivery/location/location_api_clients.dart';
import 'package:bitapp/core/services/api/delivery/location/location_model.dart';

import 'package:flutter/material.dart';

class LocationPageModel with ChangeNotifier {
  var locationModel = <Location>[];

  Future<void> getLocationList(phrase) async {
    //TODO: Будум записывать в local и получать по IP
    final locationData = await ApiLocation().getLocation(phrase: phrase);

    if (locationData.result != null) {
      if (locationModel != locationData.result) {
        locationModel = locationData.result!;
      }
    } else {
      locationModel = [];
    }
    notifyListeners();
  }
}
