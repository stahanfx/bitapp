import 'package:bitapp/core/base/global_parametrs.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:bitapp/theme/styles/sized_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageAppBarBuilder extends StatelessWidget with PreferredSizeWidget {
  const HomePageAppBarBuilder({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppSize().h10 * 6);

  @override
  Widget build(BuildContext context) {
    switch (AppSettings.homeAppbarViewType) {
      case 'light':
        return _homeAppBarLight();
      default:
        return _homeAppBarLight();
    }
  }
}

_homeAppBarLight() {
  return AppBar(
    title: AppFonts.b16(
      value: 'OUIPERFUME',
      color: AppColor().black,
    ),
    leading: IconButton(
      icon: const Icon(
        FontAwesomeIcons.gift,
      ),
      onPressed: () {},
    ),
    actions: [
      IconButton(
        icon: const Icon(
          FontAwesomeIcons.heart,
        ),
        onPressed: () {},
      ),
    ],
  );
}
