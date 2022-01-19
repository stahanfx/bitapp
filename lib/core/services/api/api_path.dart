import 'package:bitapp/core/base/global_parametrs.dart';

class ApiPatchCatalog {
  static String categoryList() =>
      '${AppSettings.baseApiAddress}/catalog.trade.list';
}

class ApiPatchFile {
  static String imageGet() => '${AppSettings.baseApiAddress}/file.images.get';
}

class ApiPatchProduct {
  static String productGet() =>
      '${AppSettings.baseApiAddress}/product.trade.list';
  static String getProductElement() =>
      '${AppSettings.baseApiAddress}/product.trade.element';
}
