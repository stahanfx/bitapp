import 'package:bitapp/core/services/api/user/user_api_client.dart';
import 'package:bitapp/views/basket/basket_page_model.dart';
import 'package:dio/dio.dart';

import 'package:bitapp/core/services/api/api_path.dart';

import '../../../base/global_parametrs.dart';
import 'basket_model.dart';

class ApiBasketGet {
  final client = Dio();

  Future<BasketResponse> getList({required fuserId}) async {
    _queryGeneratorGetList({required fuserId}) {
      var filterList = 'FUSER_ID=$fuserId&';
      return filterList;
    }

    final url = Uri(
      scheme: AppSettings.baseSheme,
      host: AppSettings.baseHost,
      path: ApiPatchBasket.getList(),
      query: _queryGeneratorGetList(fuserId: fuserId),
    );
    final request = await client.get(url.toString());
    final response = await request.data;
    final responseData = BasketResponse.fromJson(response);
    return responseData;
  }
}

class ApiBasketPost {
  final client = Dio();

  Future postProduct({required filter}) async {
    _queryGeneratorPostProduct({required Map<String, dynamic> filter}) {
      var filterList = [];
      filter.forEach((key, value) {
        filterList.add('$key=$value&');
      });
      var filterResult = filterList.join();
      var list = [filterResult];
      var stringList = list.join("");
      return stringList;
    }

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
}

class ApiBasketDelete {
  final client = Dio();

  Future deleteProduct({required id}) async {
    _queryGeneratorDeleteProduct({required String id}) {
      var filterList = 'ID=$id&';
      return filterList;
    }

    final url = Uri(
      scheme: AppSettings.baseSheme,
      host: AppSettings.baseHost,
      path: ApiPatchBasket.deleteProduct(),
      query: _queryGeneratorDeleteProduct(id: id),
    );
    final request = await client.get(url.toString());
    final response = await request.data;
    return response;
  }

  Future deleteAllProduct() async {
    _queryGeneratorDeleteAllProduct() async {
      var fuserId = await UserApiGet().getLocalFuser();
      var filterList = 'FUSER=$fuserId&';
      return filterList;
    }

    final url = Uri(
      scheme: AppSettings.baseSheme,
      host: AppSettings.baseHost,
      path: ApiPatchBasket.deleteAllProduct(),
      query: await _queryGeneratorDeleteAllProduct(),
    );
    final request = await client.get(url.toString());
    final response = await request.data;
    return response;
  }
}

class ApiBasketPut {
  final client = Dio();

  Future putProduct({required id, required quantity}) async {
    final url = Uri(
      scheme: AppSettings.baseSheme,
      host: AppSettings.baseHost,
      path: ApiPatchBasket.putProduct(),
      query: _queryGeneratorPutProduct(id: id, quantity: quantity),
    );
    final request = await client.get(url.toString());
    final response = await request.data;
    return response;
  }

  _queryGeneratorPutProduct({required String id, required quantity}) {
    var filterList = 'ID=$id&QUANTITY=$quantity&';
    return filterList;
  }
}
