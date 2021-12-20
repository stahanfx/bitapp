import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/services/file/image_services.dart';
import 'package:bitapp/core/theme/styles/font_style.dart';
import 'package:bitapp/core/theme/styles/global_style.dart';
import 'package:bitapp/core/theme/widgets/buttons_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      provider.getCatalog({'SECTION_ID': 'false', 'IBLOCK_ID': '26'}, 'light');
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
          _CAtalogScroll(catalogs: catalogs),
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
    final catalogs = provider.catalogsList;
    final catalog = catalogs[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => print(catalog.id),
          child: Column(
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                width: 70.w,
                height: 70.h,
                child: GetImageApi(id: catalog.picture as String),
              ),
              SizedBox(width: 70.w),
              Container(
                width: 100,
                height: 50,
                // child: Text(
                //   catalog.name as String,
                //   textAlign: TextAlign.center,
                // ),
              ),
              SizedBox(width: 100.h),
            ],
          ),
        )
      ],
    );
  }
}
