import 'package:bitapp/core/base/global_parametrs.dart';

class ApiHelper {
  Uri uriGenerator({required String query, required patch}) {
    return Uri(
      scheme: AppSettings.baseSheme,
      host: AppSettings.baseHost,
      path: patch,
      query: query,
    );
  }
}
