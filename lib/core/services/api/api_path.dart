import 'package:bitapp/core/services/api/global_parametrs.dart';

class ApiPatchCatalog {
  static String categoryList() => '$baseApiAddress/catalog.trade.list';
}

class ApiPatchFile {
  static String imageGet() => '$baseApiAddress/file.images.get';
}

class ApiPatchProduct {
  static String productGet() => '$baseApiAddress/product.trade.list';
}
