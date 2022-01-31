import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:bitapp/views/profile/profile_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerProfile = context.watch<ProfilePageModel>();
    providerProfile.getUserModel();
    return Consumer<ProfilePageModel>(
      builder: (context, model, child) {
        return Scaffold(
            backgroundColor: AppColor.backgroun,
            appBar: AppBar(
              title: AppText.b12(value: "Профиль", color: AppColor.black),
            ),
            body: Center(
              child: Column(
                children: [
                  AppText.b12(
                      value: 'User_ID: ${model.userModel?.userId.toString()}',
                      color: AppColor.black),
                  AppText.b12(
                      value: 'Fuser_ID: ${model.userModel?.fuserId.toString()}',
                      color: AppColor.black),
                  AppText.b12(
                      value: 'Phone_Number: ${model.userModel?.phoneNumber}',
                      color: AppColor.black),
                ],
              ),
            ));
      },
    );

    // FutureBuilder(
    //   future: _getModel(),
    //   builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
    //     switch (snapshot.connectionState) {
    //       case ConnectionState.waiting:
    //         return const Center(child: Text('Loading....'));
    //       default:
    //         if (snapshot.hasError) {
    //           return Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Center(child: Text('Error: ${snapshot.error}')),
    //           );
    //         } else {
    //           //
    //           return
    //           Scaffold(
    //               backgroundColor: AppColor.backgroun,
    //               appBar: AppBar(
    //                 title: AppText.b12(value: "Профиль", color: AppColor.black),
    //               ),
    //               body: Center(
    //                 child: Column(
    //                   children: [
    //                     AppText.b12(
    //                         value: 'User_ID: ${userModel?.userId.toString()}',
    //                         color: AppColor.black),
    //                     AppText.b12(
    //                         value: 'Fuser_ID: ${userModel?.fuserId.toString()}',
    //                         color: AppColor.black),
    //                     AppText.b12(
    //                         value: 'Phone_Number: ${userModel?.phoneNumber}',
    //                         color: AppColor.black),
    //                   ],
    //                 ),
    //               ));
    //         }
    //     }
    //   },
    // );
  }
}
