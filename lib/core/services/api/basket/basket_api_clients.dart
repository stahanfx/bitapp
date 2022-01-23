import 'package:bitapp/core/services/api/api_path.dart';
import 'package:dio/dio.dart';

import '../../../base/global_parametrs.dart';
import 'basket_model.dart';

class ApiBasketGet {
  final filter;

  final client = Dio();

  ApiBasketGet({
    required this.filter,
  });

  Future<FuserResponse> getFuser() async {
    final url = Uri(
      scheme: AppSettings.baseSheme,
      host: AppSettings.baseHost,
      path: ApiPatchBasket.getFuser(),
    );
    final request = await client.get(url.toString());
    final response = await request.data;
    final responseData = FuserResponse.fromJson(response);
    return responseData;
  }

  Future<BasketResponse> getList() async {
    final url = Uri(
      scheme: AppSettings.baseSheme,
      host: AppSettings.baseHost,
      path: ApiPatchBasket.getList(),
      query: _queryGeneratorGetList(filter: filter),
    );
    final request = await client.get(url.toString());
    final response = await request.data;
    final responseData = BasketResponse.fromJson(response);
    return responseData;
  }

  //TODO: Кривой метод, надо поправить желательно весь генератор(принцип)
  _queryGeneratorGetList({required filter}) {
    var filterList = 'filter[FUSER_ID]=$filter&';
    return filterList;
  }
}

class ApiBasketPost {
  Map<String, dynamic> filter;

  final client = Dio();

  ApiBasketPost({
    required this.filter,
  });

  Future postProduct() async {
    final url = Uri(
      scheme: AppSettings.baseSheme,
      host: AppSettings.baseHost,
      path: ApiPatchBasket.postProduct(),
      query: _queryGeneratorPostProduct(filter: filter),
    );
    final request = await client.get(url.toString());
    final response = await request.data;
    // final responseData = BasketResponse.fromJson(response);
    return response;
  }

  _queryGeneratorPostProduct({
    required Map<String, dynamic> filter,
  }) {
    var filterList = [];
    filter.forEach((key, value) {
      filterList.add('filter[$key]=$value&');
    });
    var filterResult = filterList.join();

    var list = [
      filterResult,
    ];

    var stringList = list.join("");
    return stringList;
  }
}
