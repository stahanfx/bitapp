import 'package:bitapp/core/base/global_parametrs.dart';
import 'package:bitapp/core/services/api/category/category_model.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/widgets/category/category_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_appbar_builder.dart';
import 'home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryItem> categoryListModel = [];

  Future<void> _getModel() async {
    final model = context.watch<HomePageModel>();
    // categoryListModel.clear();
    final categoryListData = await model.getCategory(
        {'SECTION_ID': 'false', 'IBLOCK_ID': AppSettings.baseTradeCatalog},
        'light');
    categoryListModel += categoryListData;
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
              //
              return Scaffold(
                backgroundColor: AppColor().backgroun,
                appBar: const HomePageAppBarBuilder(),
                body: ListView(
                  children: [
                    CategoryListBuilder(categoryListModel: categoryListModel)
                        .home(),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
