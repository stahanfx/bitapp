import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home/home_page.dart';
import 'pages/home/home_page_model.dart';

class LoadApp extends StatelessWidget {
  const LoadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => HomePageModel()),
    ], child: const HomePage());
  }
}
