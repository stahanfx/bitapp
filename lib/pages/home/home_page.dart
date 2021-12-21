import 'package:bitapp/core/services/api/api_path.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/services/file/image_services.dart';
import 'package:bitapp/core/theme/styles/font_style.dart';
import 'package:bitapp/core/theme/styles/global_style.dart';
import 'package:bitapp/core/theme/widgets/buttons_widgets.dart';
import 'package:bitapp/pages/product_list/product_list_page.dart';
import 'package:bitapp/pages/product_list/product_list_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import 'home_page_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomePageModel>();
    final catalogs = provider.catalogsList;

    if (provider.catalogsList.isEmpty) {
      provider.getCatalog(
          {'SECTION_ID': 'false', 'IBLOCK_ID': baseTradeCatalog}, 'light');
    }

    return Scaffold(
      backgroundColor: bitAppColorBackgroun,
      appBar: AppBar(
        title: BitAppFonts.head_2(value: 'Главная', color: bitAppColorBlack),
        actions: [
          BitAppButtonIcon.appBar(onPressed: () {}, icon: Icons.print),
          BitAppButtonIcon.appBar(onPressed: () {}, icon: Icons.clear),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.infinity,
              height: 150,
              color: Colors.redAccent,
            ),
          ),
          SizedBox(height: 150, child: _CAtalogScroll(catalogs: catalogs)),
        ],
      ),
    );
  }
}

class _CAtalogScroll extends StatelessWidget {
  const _CAtalogScroll({
    Key? key,
    required this.catalogs,
  }) : super(key: key);

  final List<Catalog> catalogs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: catalogs.length,
            itemBuilder: (BuildContext context, int index) {
              return _PostRowWidget(index: index);
            },
          ),
        ),
      ),
    );
  }
}

class _PostRowWidget extends StatelessWidget {
  final int index;
  const _PostRowWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomePageModel>();
    final catalogList = provider.catalogsList;
    final catalog = catalogList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(create: (_) => ProductListModel()),
                  ChangeNotifierProvider(create: (_) => ProductListModel()),
                ],
                child: ProductList(
                  categoryId: catalog.id,
                ),
              ),
            ),
          ),
          child: Column(
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                width: 60.w,
                height: 60.h,
                child: GetImageApi(id: catalog.picture as String),
              ),
              SizedBox(width: 70.w),
              Container(
                width: 80,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: BitAppFonts.capt_1_2(
                    textAlign: TextAlign.center,
                    value: catalog.name as String,
                    color: bitAppColorBlack,
                  ),
                ),
              ),
              SizedBox(width: 100.h),
            ],
          ),
        )
      ],
    );
  }
}
