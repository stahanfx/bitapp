import 'package:bitapp/core/services/api/user/user_api_client.dart';
import 'package:bitapp/views/basket/basket_page_model.dart';
import 'package:dio/dio.dart';

import 'package:bitapp/core/services/api/api_path.dart';

import '../../../base/global_parametrs.dart';
import 'basket_model.dart';

class ApiBasketGet {
  final client = Dio();

  //TODO: Нужно вынести метод в юзера
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

  Future<BasketResponse> getList({required filter}) async {
    _queryGeneratorGetList({required filter}) {
      var filterList = 'filter[FUSER_ID]=$filter&';
      return filterList;
    }

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
}

class ApiBasketPost {
  final client = Dio();

  Future postProduct({required filter}) async {
    _queryGeneratorPostProduct({required Map<String, dynamic> filter}) {
      var filterList = [];
      filter.forEach((key, value) {
        filterList.add('filter[$key]=$value&');
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
      var fuserId = await UserApiGet().getFuser();
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
