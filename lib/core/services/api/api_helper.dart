import 'package:bitapp/core/base/global_parametrs.dart';

class ApiHelper {
  Uri uriGenerator({required String query, required patch}) {
    return Uri(
      scheme: AppGlobalSettings.baseSheme,
      host: AppGlobalSettings.baseHost,
      path: patch,
      query: query,
    );
  }
}
