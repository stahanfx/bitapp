import 'package:bitapp/core/services/api/basket/basket_api_clients.dart';
import 'package:bitapp/core/services/api/delivery/location/location_api_clients.dart';
import 'package:bitapp/core/services/api/delivery/location/location_model.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LocationPageModel with ChangeNotifier {
  var locationModel = <Location>[];

  Future<void> getLocationList(phrase) async {
    // final fuserId = await getFuser(); //TODO: Будум записывать в local и получать по IP
    final locationData = await ApiLocation(phrase: phrase).getLocation();

    if (locationData.result != null) {
      if (locationModel != locationData.result) {
        locationModel = locationData.result!;
      }
    } else {
      locationModel = [];
    }
    print("Локации обновлены на ");
    notifyListeners();
  }
}
