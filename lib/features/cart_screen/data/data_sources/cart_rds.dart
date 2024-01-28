import 'package:amad_furniture/core/api/api_consummer.dart';
import 'package:amad_furniture/core/api/end_points.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/constantes.dart';
import '../models/product_amount_model.dart';

abstract class CartRDS {
  Future<String> addAmountOfProductToCart(
      ProductAmountModel productAmountModel);
  Future<dynamic> getCart();
}

class CartRdsImp implements CartRDS {
  final ApiConsumer client;
  Map<String, dynamic> headers = {};

  CartRdsImp({required this.client});

  @override
  Future<String> addAmountOfProductToCart(
      ProductAmountModel productAmountModel) async {
    try {
      final response = await client.post(
          "${EndPoints.BASE_URL + EndPoints.ADD_PRODUCT_TO_CART}",
          body: productAmountModel.toJson(),
          headers: {
            "Authorization": "Bearer ${token}",
          });
      return response["message"];

    }catch (e){
      rethrow;
    }
  }

  @override
  Future<dynamic> getCart() async {
    try {
      final response = await client.get(
          EndPoints.BASE_URL + EndPoints.GET_CART,
          headers: {
            "Authorization": "Bearer ${token}",
          }
      );
      return response;
    }on DioException catch (e){
      print(e.response?.data['message']);
      rethrow;
    }
  }
}
