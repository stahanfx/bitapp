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

_queryGenerator({required phrase}) {
  if (phrase == '') {
    phrase = 'Москва';
  }
  var request = 'PHRASE=$phrase';
  print(request);
  return request;
}
