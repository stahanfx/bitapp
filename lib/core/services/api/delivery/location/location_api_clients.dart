import 'package:dio/dio.dart';

import 'package:bitapp/core/base/global_parametrs.dart';
import 'package:bitapp/core/services/api/api_path.dart';

import 'location_model.dart';

class ApiLocation {
  final client = Dio();

  Future<LocationResponse> getLocation({required phrase}) async {
    _queryGeneratorGetLocation({required String phrase}) {
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
      String request = 'PHRASE=$checkPhrase';
      return request;
    }

    final url = Uri(
      scheme: AppSettings.baseSheme,
      host: AppSettings.baseHost,
      path: ApiPatchDelivery.getLocation(),
      query: _queryGeneratorGetLocation(phrase: phrase),
    );
    final request = await client.get(url.toString());
    final response = await request.data;
    final responseData = LocationResponse.fromJson(response);
    return responseData;
  }
}
