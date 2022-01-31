import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/sized_style.dart';
import 'package:bitapp/views/basket/basket_page.dart';
import 'package:bitapp/views/basket/basket_page_model.dart';
import 'package:bitapp/views/catalog/category_arguments_models.dart';
import 'package:bitapp/views/catalog/catalog_page.dart';
import 'package:bitapp/views/home/home_page.dart';
import 'package:bitapp/views/product/product_arguments_models.dart';
import 'package:bitapp/views/product/product_page.dart';
import 'package:bitapp/views/test/test.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NavigationPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroun,
      extendBody: true,
      body: _getPage(),
      bottomNavigationBar: _getDesign(),
    );
  }

  Widget _getDesign() {
    final basketProvider = context.watch<BasketPageModel>();
    final basketCount = basketProvider.basketModel.length;

    List<int> _badgeCounts = List<int>.generate(5, (index) => index);
    List<bool> _badgeShows = List<bool>.generate(5, (index) => true);

    return SizedBox(
      height: AppSize().h10 * 8,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppSize().r10 * 4),
          topLeft: Radius.circular(AppSize().r10 * 4),
        ),
        child: CustomNavigationBar(
          //TODO: Доделать и переписать на провайдер
          iconSize: AppSize().h10 * 2.2,
          selectedColor: Colors.white,
          strokeColor: Colors.white,
          unSelectedColor: const Color(0x90ffffff),
          backgroundColor: AppColor.activeButton,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.home),
            ),
            CustomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.grid2),
            ),
            CustomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.bagShopping),
              badgeCount: _badgeCounts[basketCount],
              showBadge: _badgeShows[0],
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
          if (settings.name == 'catalog') {
            page = CatalogPage(
              argument: settings.arguments as CategoryArgument,
            );
          }
          if (settings.name == 'catalog/product') {
            page = ProductPage(argument: settings.arguments as ProductArgument);
          }
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
      Navigator(
        onGenerateRoute: (settings) {
          Widget page = const TestPage();
          if (settings.name == 'test') {
            page = const TestPage(
                // argument: settings.arguments as CategoryArgument,
                );
          }
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
      const BasketPage(),
      // Navigator(
      //   onGenerateRoute: (settings) {
      //     Widget page = const BasketPage();
      //     if (settings.name == 'basket') {
      //       page = const BasketPage(
      //           // argument: settings.arguments as CategoryArgument,
      //           );
      //     }
      //     if (settings.name == 'basket/lightRegistration') {
      //       page = const LightRegistrationPage(
      //           // argument: settings.arguments as CategoryArgument,
      //           );
      //     }
      //     if (settings.name == 'basket/lightRegister/location') {
      //       page = const LocationPage(
      //           // argument: settings.arguments as CategoryArgument,
      //           );
      //     }
      //     if (settings.name == 'order/delivery') {
      //       page = OrderDeliveryPage(
      //         argument: settings.arguments as OrderDeliveryArgument,
      //       );
      //     }
      //     return MaterialPageRoute(builder: (_) => page);
      //   },
      // ),
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
