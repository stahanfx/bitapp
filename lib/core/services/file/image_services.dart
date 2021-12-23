import 'package:bitapp/core/services/api/api_path.dart';
import 'package:bitapp/core/services/api/files/files_api_clients.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GetImageApi extends StatelessWidget {
  dynamic id;
  GetImageApi({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (id == null) {
      return Image.asset('assets/images/no-image.png');
    } else {
      return FutureBuilder<String>(
        future: getImage(id),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          //const CircularProgressIndicator();
          if (snapshot.data != null) {
            return Image.network(snapshot.data as String);
          } else {
            return Image.asset('assets/images/no-image.png');
          }
        },
      );
    }
  }

  Future<String> getImage(id) async {
    var file = await ApiFile(id: id).getFile();
    var imageUrl = '$siteUrl${file.result}';
    return imageUrl;
  }
}
