import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/sized_style.dart';
import 'package:bitapp/views/basket/basket_page.dart';
import 'package:bitapp/views/catalog/category_arguments_models.dart';
import 'package:bitapp/views/catalog/catalog_page.dart';
import 'package:bitapp/views/home/home_page.dart';
import 'package:bitapp/views/product/product_arguments_models.dart';
import 'package:bitapp/views/product/product_page.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import 'navigation_page_model.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NavigationPage> {
  int _currentIndex = 0;

  final List<bool> _badgeShows = List<bool>.generate(5, (index) => true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().backgroun,
      extendBody: true,
      body: _getPage(),
      bottomNavigationBar: _getDesign(),
    );
  }

  Widget _getDesign() {
    final provider = context.watch<NavigationPageModel>();
    final basketCount = provider.basketCount;
    return SizedBox(
      height: AppSize().h10 * 8,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppSize().r10 * 4),
          topLeft: Radius.circular(AppSize().r10 * 4),
        ),
        child: CustomNavigationBar(
          iconSize: AppSize().h10 * 2.2,
          selectedColor: Colors.white,
          strokeColor: Colors.white,
          unSelectedColor: const Color(0x90ffffff),
          backgroundColor: AppColor().activeButton,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.home),
            ),
            CustomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.grid2),
            ),
            CustomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.bagShopping),
              badgeCount: basketCount,
              showBadge: _badgeShows[2],
            ),
            CustomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.heart),
            ),
            CustomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.user),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _badgeShows[index] = false;
            });

            // if (index != _currentIndex) {
            //   setState(() {
            //     _currentIndex = index;
            //     _badgeShows[index] = false;
            //   });
            // }
          },
        ),
      ),
    );
  }

  Widget _getPage() {
    List<Widget> pages = [
      Navigator(
        onGenerateRoute: (settings) {
          Widget page = const HomePage();
          if (settings.name == "catalog") {
            page = CatalogPage(
              argument: settings.arguments as CategoryArgument,
            );
          }
          if (settings.name == "catalog/product") {
            page = ProductPage(argument: settings.arguments as ProductArgument);
          }
          return MaterialPageRoute(builder: (_) => page);
        },
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
        child: BasketPage(),
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
