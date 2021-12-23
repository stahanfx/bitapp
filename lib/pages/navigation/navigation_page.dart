import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/theme/styles/global_style.dart';
import 'package:bitapp/pages/catalog/catalog_page.dart';
import 'package:bitapp/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import 'navigation_page_model.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NavigationPage> {
  int _currentIndex = 0;

  final List<bool> _badgeShows = List<bool>.generate(5, (index) => true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bitAppColorBackgroun,
      extendBody: true,
      body: _getBody(),
      bottomNavigationBar: _buildOriginDesign(),
    );
  }

  Widget _buildOriginDesign() {
    final provider = context.watch<NavigationPageModel>();
    final basketCount = provider.basketCount;
    return SizedBox(
      height: 78.h,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(36.r),
          topLeft: Radius.circular(36.r),
        ),
        child: CustomNavigationBar(
          iconSize: 30.0.w,
          selectedColor: Colors.white,
          strokeColor: Colors.white,
          unSelectedColor: const Color(0x90ffffff),
          backgroundColor: bitAppColorActiveButton,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(Icons.home),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.lightbulb_outline),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              badgeCount: basketCount,
              showBadge: _badgeShows[2],
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.search),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.account_circle),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _badgeShows[index] = false;
            });
          },
        ),
      ),
    );
  }

  Widget _getBody() {
    List<Widget> pages = [
      Navigator(
        onGenerateRoute: (settings) {
          Widget page = HomePage();
          if (settings.name == "home/catalog")
            page = CatalogPage(
              argument: settings.arguments,
            );
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
      // Container(
      //   alignment: Alignment.center,
      //   child: const HomePage(),
      // ),
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Category",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Bags",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Wishlist",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Profile",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}
