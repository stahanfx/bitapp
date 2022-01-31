import 'package:bitapp/core/services/api/user/api_user_get.dart';
import 'package:bitapp/core/services/api/user/user_model.dart';
import 'package:flutter/material.dart';

class ProfilePageModel with ChangeNotifier {
  UserModel? userModel;

  Future<void> getUserModel() async {
    UserModel responce = await ApiUserGet.userModel();
    userModel = responce;
    notifyListeners();
  }
}
