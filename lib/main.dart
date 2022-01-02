import 'package:bitapp/core/theme/styles/color_style.dart';
import 'package:bitapp/pages/catalog/catalog_page.dart';
import 'package:bitapp/pages/home/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'load_app.dart';
import 'pages/catalog/catalog_page_model.dart';
import 'pages/home/home_page_model.dart';
import 'pages/navigation/navigation_page_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  runApp(
    EasyLocalization(
      child: const MyApp(),
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('en', 'US'),
      ],
      fallbackLocale: const Locale('ru', 'RU'),
      path: 'assets/translations',
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CatalogPageModel()),
          ChangeNotifierProvider(create: (_) => NavigationPageModel()),
          ChangeNotifierProvider(create: (_) => HomePageModel()),
        ],
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            textTheme:
                GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
            backgroundColor: AppColor().backgroun,
            appBarTheme: AppBarTheme(
                toolbarTextStyle: TextStyle(color: AppColor().black),
                iconTheme: IconThemeData(color: AppColor().black),
                backgroundColor: AppColor().backgroun,
                elevation: 0,
                titleTextStyle: TextStyle(color: AppColor().black)),
            primarySwatch: Colors.blue,
          ),
          initialRoute: 'loader',
          routes: {
            'loader': (context) => const LoadApp(),
            'home': (context) => const HomePage(),
            'home/catalog': (context) => const CatalogPage(argument: null),
          },
        ),
      ),
    );
  }
}
