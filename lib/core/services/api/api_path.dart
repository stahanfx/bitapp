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

class ApiPatchBasket {
  static String getFuser() => '${AppSettings.baseApiAddress}/basket.get.fuser';
  static String getList() => '${AppSettings.baseApiAddress}/basket.get.list';
  static String postProduct() =>
      '${AppSettings.baseApiAddress}/basket.post.product';
  static String putProduct() =>
      '${AppSettings.baseApiAddress}/basket.put.product';
  static String deleteProduct() =>
      '${AppSettings.baseApiAddress}/basket.delete.product';
  static String deleteAll() =>
      '${AppSettings.baseApiAddress}/basket.delete.all';
}

class ApiPatchDelivery {
  static String getLocation() =>
      '${AppSettings.baseApiAddress}/delivery.get.location';
}
