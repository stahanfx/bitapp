import 'package:flutter/material.dart';

import 'theme/styles/color_style.dart';
import 'views/basket/basket_page_model.dart';
import 'views/home/home_model.dart';
import 'views/navigation/navigation_page.dart';
import 'package:provider/src/provider.dart';

class LoadApp extends StatelessWidget {
  const LoadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<BasketPageModel>();
    return FutureBuilder(
        future: provider.getBasketList(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
            default:
              return Scaffold(
                  backgroundColor: AppColor().backgroun,
                  body: NavigationPage());
          }
        });
  }
}
