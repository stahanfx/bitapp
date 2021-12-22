import 'package:bitapp/pages/navigation/navigation_page.dart';
import 'package:bitapp/pages/navigation/navigation_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/catalog/catalog_page_model.dart';
import 'pages/home/home_page_model.dart';

class LoadApp extends StatelessWidget {
  const LoadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageModel()),
        ChangeNotifierProvider(create: (_) => NavigationPageModel()),
      ],
      child: const NavigationPage(),
    );
  }
}
