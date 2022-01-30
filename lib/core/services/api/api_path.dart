import 'package:bitapp/core/base/global_parametrs.dart';

class ApiPatchCategoryGet {
  static String list() =>
      '${AppGlobalSettings.baseApiAddress}/catalog.trade.list';
}

class ApiPatchFileGet {
  static String file() => '${AppGlobalSettings.baseApiAddress}/file.images.get';
}

class ApiPatchProductGet {
  static String list() =>
      '${AppGlobalSettings.baseApiAddress}/product.trade.list';
  static String item() =>
      '${AppGlobalSettings.baseApiAddress}/product.trade.element';
}

class ApiPatchBasket {
  static String getList() =>
      '${AppGlobalSettings.baseApiAddress}/basket.get.list';
  static String postProduct() =>
      '${AppGlobalSettings.baseApiAddress}/basket.post.product';
  static String putProduct() =>
      '${AppGlobalSettings.baseApiAddress}/basket.put.product';
  static String deleteProduct() =>
      '${AppGlobalSettings.baseApiAddress}/basket.delete.product';
  static String deleteBasket() =>
      '${AppGlobalSettings.baseApiAddress}/basket.delete.all';
}

class ApiPatchOrderGet {
  static String location() =>
      '${AppGlobalSettings.baseApiAddress}/delivery.get.location';
  static String delivery() =>
      '${AppGlobalSettings.baseApiAddress}/basket.post.basket';
  static String payment() =>
      '${AppGlobalSettings.baseApiAddress}/basket.post.basket';
}

class ApiPatchUserGet {
  static String fuser() => '${AppGlobalSettings.baseApiAddress}/user.get.fuser';
}

class ApiPatchUserPost {
  static String registrations() =>
      '${AppGlobalSettings.baseApiAddress}/user.auth.registration';
}
