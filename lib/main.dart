import 'package:bitapp/core/theme/styles/global_style.dart';
import 'package:bitapp/pages/catalog/catalog_page.dart';
import 'package:bitapp/pages/home/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'load_app.dart';
import 'pages/catalog/catalog_page_model.dart';
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
          ChangeNotifierProvider(create: (_) => CatalogModel()),
          ChangeNotifierProvider(create: (_) => NavigationPageModel()),
        ],
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            textTheme:
                GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
            backgroundColor: bitAppColorBackgroun,
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: bitAppColorBlack),
                backgroundColor: bitAppColorBackgroun,
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: bitAppColorBlack,
                )),
            primarySwatch: Colors.blue,
          ),
          initialRoute: 'loader',
          routes: {
            // When navigating to the "homeScreen" route, build the HomeScreen widget.
            'loader': (context) => const LoadApp(),
            // When navigating to the "secondScreen" route, build the SecondScreen widget.
            'home': (context) => const HomePage(),
            'home/catalog': (context) => CatalogPage(
                  argument: null,
                ),
          },
        ),
      ),
    );
  }
}
