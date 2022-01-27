import 'package:bitapp/core/services/api/user/user_api_client.dart';
import 'package:bitapp/core/services/api/user/user_model.dart';
import 'package:flutter/material.dart';

class LightRegistrationPageModel with ChangeNotifier {
  var massage = '';
  var type = '';
  var id = '';

  Future postLightRegistration({name, phone}) async {
    RegistrationResponse registrationResponce =
        await UserApiPost().postLightRegistration(name: name, phone: phone);
    massage = registrationResponce.result!.message!;
    type = registrationResponce.result!.type!;
    id = registrationResponce.result!.type!;
    notifyListeners();
  }
}
