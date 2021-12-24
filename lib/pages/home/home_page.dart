import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bitapp/core/services/api/api_path.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/theme/styles/font_style.dart';
import 'package:bitapp/core/theme/styles/global_style.dart';
import 'package:bitapp/core/theme/widgets/buttons_widgets.dart';
import 'package:bitapp/core/theme/widgets/catalog/catalog_element_widget.dart';
import 'package:bitapp/pages/catalog/catalog_page.dart';
import 'package:bitapp/pages/catalog/catalog_page_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Инициализируем базовые данные
// - Обьявляем переменные модели
  var catalogListModel = <Catalog>[];

//Обьявляем методы
// - Методы локальной модели
  Future<void> _getLocalModel() async {
    final model = context.watch<CatalogModel>();
    catalogListModel.clear();
    final catalogListData = await model.getCatalog(
        {'SECTION_ID': 'false', 'IBLOCK_ID': baseTradeCatalog}, 'light');
    catalogListModel += catalogListData;
  }

//Методы глобальной модели

  @override
  Widget build(BuildContext context) {
    print('Инициализатор HomePage запущен');
    //Запускаем получение 'Будущего'
    //
    return FutureBuilder(
      future: _getLocalModel(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          // return Center(child: Text('Loading....'));
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Scaffold(
                backgroundColor: bitAppColorBackgroun,
                appBar: AppBar(
                  title: BitAppFonts.head_2(
                      value: 'Главная', color: bitAppColorBlack),
                  actions: [
                    BitAppButtonIcon.appBar(
                        onPressed: () {}, icon: Icons.print),
                    BitAppButtonIcon.appBar(
                        onPressed: () {}, icon: Icons.clear),
                  ],
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _CatalogListBuilder(
                      catalogListModel: catalogListModel,
                    ),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}

// ignore: must_be_immutable
class _CatalogListBuilder extends StatelessWidget {
  List<Catalog> catalogListModel;
  _CatalogListBuilder({
    Key? key,
    required this.catalogListModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        cacheExtent: 800,
        scrollDirection: Axis.horizontal,
        itemCount: catalogListModel.length,
        itemBuilder: (BuildContext context, int index) {
          return _CatalogListElementBuilder(
            index: index,
            catalogsList: catalogListModel,
            // catalogList: dataTest,
          );
        },
      ),
    );
  }
}

class _CatalogListElementBuilder extends StatelessWidget {
  final int index;
  final List<Catalog> catalogsList;
  const _CatalogListElementBuilder({
    Key? key,
    required this.index,
    required this.catalogsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catalog = catalogsList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CatalogPage(
                        argument: catalog.id,
                      )),
            );
          },
          child: CatalogElementWidget(catalog: catalog),
        ),
      ],
    );
  }
}


// return Scaffold(
//                 backgroundColor: bitAppColorBackgroun,
//                 appBar: AppBar(
//                   title: BitAppFonts.head_2(
//                       value: 'Главная', color: bitAppColorBlack),
//                   actions: [
//                     BitAppButtonIcon.appBar(
//                         onPressed: () {}, icon: Icons.print),
//                     BitAppButtonIcon.appBar(
//                         onPressed: () {}, icon: Icons.clear),
//                   ],
//                 ),
//                 body: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     _CatalogListBuilder(
//                       catalogListModel: catalogListModel,
//                     ),
//                   ],
//                 ),
//               );