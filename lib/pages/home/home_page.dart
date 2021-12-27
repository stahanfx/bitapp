import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:bitapp/core/services/api/api_path.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/theme/styles/font_style.dart';
import 'package:bitapp/core/theme/styles/global_style.dart';
import 'package:bitapp/core/theme/widgets/buttons_widgets.dart';
import 'package:bitapp/core/theme/widgets/catalog/catalog_element_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_page_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var catalogListModel = <Catalog>[];

  Future<void> _getLocalModel() async {
    final model = context.watch<HomePageModel>();
    catalogListModel.clear();
    final catalogListData = await model.getCatalog(
        {'SECTION_ID': 'false', 'IBLOCK_ID': baseTradeCatalog}, 'light');
    catalogListModel += catalogListData;
  }

  @override
  Widget build(BuildContext context) {
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
                        onPressed: () {}, icon: FontAwesomeIcons.filter),
                    SizedBox(width: 10.w)
                  ],
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CatalogListBuilder(
                      model: catalogListModel,
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
