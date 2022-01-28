import 'package:bitapp/core/base/global_parametrs.dart';

class ApiPatchCategoryGet {
  static String list() => '${AppSettings.baseApiAddress}/catalog.trade.list';
}

class ApiPatchFileGet {
  static String file() => '${AppSettings.baseApiAddress}/file.images.get';
}

class ApiPatchProductGet {
  static String list() => '${AppSettings.baseApiAddress}/product.trade.list';
  static String item() => '${AppSettings.baseApiAddress}/product.trade.element';
}

class ApiPatchBasket {
  static String getList() => '${AppSettings.baseApiAddress}/basket.get.list';
  static String postProduct() =>
      '${AppSettings.baseApiAddress}/basket.post.product';
  static String putProduct() =>
      '${AppSettings.baseApiAddress}/basket.put.product';
  static String deleteProduct() =>
      '${AppSettings.baseApiAddress}/basket.delete.product';
  static String deleteBasket() =>
      '${AppSettings.baseApiAddress}/basket.delete.all';
}

class ApiPatchDeliveryGet {
  static String location() =>
      '${AppSettings.baseApiAddress}/delivery.get.location';
}

class ApiPatchUserGet {
  static String fuser() => '${AppSettings.baseApiAddress}/user.get.fuser';
}

class ApiPatchUserPost {
  static String registrations() =>
      '${AppSettings.baseApiAddress}/user.auth.registration';
}
