import 'package:amad_furniture/core/api/api_consummer.dart';
import 'package:amad_furniture/core/api/end_points.dart';
import 'package:amad_furniture/features/cart_screen/data/models/order_data.dart';
import 'package:amad_furniture/features/cart_screen/data/models/promocode_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/constantes.dart';
import '../models/product_amount_model.dart';

abstract class CartRDS {
  Future<String> addAmountOfProductToCart(
      ProductAmountModel productAmountModel);
  Future<String> deleteAmountOfProductFromCart(
      ProductAmountModel productAmountModel);
  Future<dynamic> getCart();
  Future<dynamic> getCitiesDeliveryPrices();
  Future<String> addPromoCodeToCart(PromoCodeModel promoCodeModel);
  Future<String> deletePromoCodeFromCart(PromoCodeModel promoCodeModel);
  Future<String> orderTheCart (OrderData orderData);
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
          EndPoints.BASE_URL + EndPoints.ADD_PRODUCT_TO_CART,
          body: productAmountModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
      return response["message"];

    }catch (e){
      rethrow;
    }
  }

  @override
    Future<String> deleteAmountOfProductFromCart(
      ProductAmountModel productAmountModel) async {
    try {
      final response = await client.delete(
          EndPoints.BASE_URL + EndPoints.DELETE_PRODUCT_FROM_CART,
          body: productAmountModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
      return response["message"];

    }catch (e){
      rethrow;
    }
  }

  @override
  Future<String> addPromoCodeToCart (PromoCodeModel promoCodeModel) async {
    try {
      final response = await client.post(
          EndPoints.BASE_URL + EndPoints.ADD_PROMOCODE,
          body: promoCodeModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
      return response["message"];

    }catch (e){
      rethrow;
    }
  }

  @override
  Future<String> deletePromoCodeFromCart(PromoCodeModel promoCodeModel) async {
    try {
      final response = await client.delete(
          EndPoints.BASE_URL + EndPoints.DELETE_PROMOCODE,
          body: promoCodeModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
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
            "Authorization": "Bearer $token",
          }
      );
      return response;
    }on DioException catch (e){
      print(e.response?.data['message']);
      rethrow;
    }
  }

  @override
  Future<dynamic> getCitiesDeliveryPrices() async {
    try {
      final response = await client.get(
          EndPoints.BASE_URL + EndPoints.GET_CITIES_DELIVERY_PRICES,
      );
      return response;
    }on DioException catch (e){
      print(e.response?.data['message']);
      rethrow;
    }
  }
  @override
  Future<String> orderTheCart (OrderData orderData) async {
    try {
      final response = await client.post(
          EndPoints.BASE_URL + EndPoints.ORDER_CART,
          body: orderData.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
      return response["message"];

    }catch (e){
      rethrow;
    }
  }
}
