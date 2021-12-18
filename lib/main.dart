import 'package:bitapp/core/theme/styles/global_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'load_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    child: const MyApp(),
    supportedLocales: const [
      Locale('ru', 'RU'),
      Locale('en', 'US'),
    ],
    fallbackLocale: const Locale('ru', 'RU'),
    path: 'assets/translations',
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
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
      home: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => const LoadApp(),
      ),
    );
  }
}
