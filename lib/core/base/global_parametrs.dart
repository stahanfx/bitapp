class AppGlobalSettings {
  static const String baseSheme = 'https';
  static const String baseHost = 'oui.ru';
  static const String baseApiAddress = 'bitapi';
  static const String siteUrl = '$baseSheme://$baseHost';
  static const String baseTradeCatalog = '38';
  static const String siteId = 's1';

//TODO: Перевести на ENUM

  //‘horisontal' or 'vertical’
  static const String categoryViewTupe = 'horisontal';
  static const String categoryAllChildrenProduct = 'N';

//Настройки отображения
//Главная
  //Категории: verticaltext -
  static const String homeCategoryViewType = 'verticaltext';
  //Appbar: light
  static const String homeAppbarViewType = 'light';

//Каталог
  //Категории: verticaltext - sliverAppBar - verticalTwoText
  static const String catalogCategiryViewType = 'verticalTwoText';
  //Appbar: light
  static const String catalogAppbarViewType = 'light';
}
