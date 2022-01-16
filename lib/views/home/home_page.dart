import 'package:bitapp/core/base/global_parametrs.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:bitapp/theme/styles/sized_style.dart';
import 'package:bitapp/theme/widgets/catalog/catalog_list_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_page_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Catalog> catalogListModel = [];

  Future<void> _getModel() async {
    final model = context.watch<HomePageModel>();
    // catalogListModel.clear();
    final catalogListData = await model.getCatalog(
        {'SECTION_ID': 'false', 'IBLOCK_ID': AppSettings.baseTradeCatalog},
        'light');
    catalogListModel += catalogListData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getModel(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: Text('Loading....'));
          default:
            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('Error: ${snapshot.error}')),
              );
            } else {
              return Scaffold(
                backgroundColor: AppColor().backgroun,
                appBar: AppBar(
                  title: Container(
                    alignment: Alignment.centerLeft,
                    child:
                        AppFonts.b16(value: 'Главная', color: AppColor().black),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: AppSize().w10),
                      child: CircleAvatar(
                        backgroundColor: AppColor().white,
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.filter,
                              size: AppSize().h10 * 2),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    catalogListBuilder(catalogListModel),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
