import 'package:bitapp/core/services/api/order/location/api_location_get.dart';
import 'package:bitapp/core/services/api/order/location/location_model.dart';

import 'package:flutter/material.dart';

class LocationPageModel with ChangeNotifier {
  var locationModel = <LocationItem>[];

  Future<void> getLocationList(phrase) async {
    String checkPhrase = phrase;
    if (checkPhrase == '') {
      checkPhrase = 'базовый';
    } else {
      String checksimbol = phrase.substring(phrase.length - 1);
      if (checksimbol == ' ' && checkPhrase.isNotEmpty) {
        checkPhrase = checkPhrase.substring(0, checkPhrase.length - 1);
      } else {
        checkPhrase = phrase;
      }
    }

    final locationData =
        await ApiOrderLocationGet.location(phrase: checkPhrase);

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
