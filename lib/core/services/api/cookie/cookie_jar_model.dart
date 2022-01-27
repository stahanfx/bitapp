import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';

void cookie() async {
  final cookies = <Cookie>[
    Cookie('name', 'wendux'),
    Cookie('location', 'china'),
  ];
  final cookiesExpired = <Cookie>[
    Cookie('name', 'wendux')..maxAge = 1,
    Cookie('location', 'china')
      ..expires = DateTime.now().add(const Duration(hours: 1)),
  ];

  final cj = CookieJar();
  //final cj = PersistCookieJar();
  // final cj = PersistCookieJar(storage: FileStorage('./example/.cookies'));

  await cj.saveFromResponse(Uri.parse('https://www.oui.ru'), cookies);
  List<Cookie> results =
      await cj.loadForRequest(Uri.parse("https://www.oui.ru"));
  print(results);
}
