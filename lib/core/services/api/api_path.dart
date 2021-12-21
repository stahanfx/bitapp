const String baseSheme = 'http';
const String baseHost = '192.168.1.82';
const String baseApiAddress = 'bitapi';
const String siteUrl = '$baseSheme://$baseHost';
const String baseTradeCatalog = '26';

class ApiPatchCatalog {
  static String categoryList() => '$baseApiAddress/catalog.trade.list';
}

class ApiPatchFile {
  static String imageGet() => '$baseApiAddress/file.images.get';
}

class ApiPatchProduct {
  static String productGet() => '$baseApiAddress/sale.product.list';
}
