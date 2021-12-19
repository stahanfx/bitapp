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
    return Scaffold(
      backgroundColor: bitAppColorBackgroun,
      appBar: AppBar(
        title: BitAppFonts.head_2(value: 'Главная', color: bitAppColorBlack),
        actions: [
          BitAppButtonIcon.appBar(
              onPressed: () {
                provider.getCatalog(
                    {'SECTION_ID': 'false', 'IBLOCK_ID': '26'}, 'light');
              },
              icon: Icons.print),
          BitAppButtonIcon.appBar(
              onPressed: () => provider.clearCatalog(), icon: Icons.clear),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: catalogs.length,
                itemBuilder: (BuildContext context, int index) {
                  return _PostRowWidget(index: index);
                },
              ),
            ),
          ),
        ],
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
          onTap: () => print(catalog.picture),
          child: Row(
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                width: 40.w,
                height: 40.h,
                child: GetImageApi(id: catalog.picture as String),
              ),
              SizedBox(width: 10.w),
              Text(catalog.name as String),
              SizedBox(height: 70.h),
            ],
          ),
        )
      ],
    );
  }
}
