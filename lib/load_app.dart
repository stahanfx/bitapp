import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'core/navigation/navigation_page.dart';
import 'views/basket/basket_page_model.dart';

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
              return const NavigationPage();
          }
        });
  }
}
