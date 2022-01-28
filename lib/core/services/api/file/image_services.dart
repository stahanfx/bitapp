import 'package:flutter/material.dart';

//TODO: ПЕРЕПИСАТЬ ВСЕ!
// ignore: must_be_immutable
class GetImageApi extends StatelessWidget {
  dynamic image;
  GetImageApi({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Image.asset('assets/images/no-image.png');
    } else {
      return FutureBuilder<String>(
        future: getImage(image),
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
    var imageUrl = '$image';
    return imageUrl;
  }
}
