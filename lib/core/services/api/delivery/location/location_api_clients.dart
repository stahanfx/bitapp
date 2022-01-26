import 'package:bitapp/core/base/global_parametrs.dart';
import 'package:bitapp/core/services/api/api_path.dart';
import 'package:dio/dio.dart';
import 'location_model.dart';

class ApiLocation {
  var phrase;
  final client = Dio();

  ApiLocation({required this.phrase});

  Future<LocationResponse> getLocation() async {
    final url = Uri(
      scheme: AppSettings.baseSheme,
      host: AppSettings.baseHost,
      path: ApiPatchDelivery.getLocation(),
      query: _queryGenerator(phrase: phrase),
    );
    print('Получили локации с запросом $phrase');
    final request = await client.get(url.toString());
    final response = await request.data;
    final responseData = LocationResponse.fromJson(response);
    return responseData;
  }
}

_queryGenerator({required String phrase}) {
  String checkPhrase = phrase;
  if (checkPhrase == '') {
    checkPhrase = 'Москва';
  } else {
    String checksimbol = phrase.substring(phrase.length - 1);
    if (checksimbol == ' ' && checkPhrase.isNotEmpty) {
      checkPhrase = checkPhrase.substring(0, checkPhrase.length - 1);
    } else {
      checkPhrase = phrase;
    }
  }

  String request = 'PHRASE=$checkPhrase';
  print(request);
  return request;
}

_spaseContril({required String text}) {
  String request;
  String checkPhrase = text.substring(text.length - 1);
  if (checkPhrase == ' ' && checkPhrase.isNotEmpty) {
    request = checkPhrase.substring(0, checkPhrase.length - 1);
  } else {
    request = text;
  }
  return request;
}
