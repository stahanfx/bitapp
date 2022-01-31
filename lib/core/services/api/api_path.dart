import 'package:bitapp/core/base/global_parametrs.dart';

class ApiPatchBasketDelete {
  static String item() =>
      '${AppGlobalSettings.baseApiAddress}/basket.delete.item';
  static String basket() =>
      '${AppGlobalSettings.baseApiAddress}/basket.delete.basket';
}

class ApiPatchBasketGet {
  static String list() => '${AppGlobalSettings.baseApiAddress}/basket.get.list';
}

class ApiPatchBasketPost {
  static String item() =>
      '${AppGlobalSettings.baseApiAddress}/basket.post.item';
}

class ApiPatchBasketPut {
  static String item() => '${AppGlobalSettings.baseApiAddress}/basket.put.item';
}

class ApiPatchCategoryGet {
  static String list() =>
      '${AppGlobalSettings.baseApiAddress}/category.get.list';
}

class ApiPatchFileGet {
  static String image() =>
      '${AppGlobalSettings.baseApiAddress}/file.get.images';
}

class ApiPatchOrderGet {
  static String location() =>
      '${AppGlobalSettings.baseApiAddress}/order.get.location';
  static String delivery() =>
      '${AppGlobalSettings.baseApiAddress}/order.get.delivery';
  static String payment() =>
      '${AppGlobalSettings.baseApiAddress}/order.get.payment';
}

class ApiPatchOrderPost {
  static String order() =>
      '${AppGlobalSettings.baseApiAddress}/order.post.order';
}

class ApiPatchProductGet {
  static String list() =>
      '${AppGlobalSettings.baseApiAddress}/product.get.list';
  static String item() =>
      '${AppGlobalSettings.baseApiAddress}/product.get.item';
}

class ApiPatchUserGet {
  static String fuser() => '${AppGlobalSettings.baseApiAddress}/user.get.fuser';
}

class ApiPatchUserPost {
  static String registrations() =>
      '${AppGlobalSettings.baseApiAddress}/user.post.registration';
}
