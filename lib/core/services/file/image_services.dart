import 'package:bitapp/core/services/api/api_path.dart';
import 'package:bitapp/core/services/api/files/files_api_clients.dart';
import 'package:flutter/material.dart';

class GetImageApi extends StatelessWidget {
  final String id;
  const GetImageApi({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getImage(id),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();
        //const CircularProgressIndicator();
        return Image.network(snapshot.data as String);
      },
    );
  }

  Future<String> getImage(id) async {
    var file = await ApiFile(id: id).getFile();
    var imageUrl = '$siteUrl${file.result}';
    return imageUrl;
  }
}
