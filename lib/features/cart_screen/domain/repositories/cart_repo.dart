import '../../data/data_sources/Cart_rds.dart';
import '../../data/models/order_the_cart_model.dart';
import '../../data/models/product_amount_model.dart';
import '../../data/models/promocode_request_model.dart';
import '../../data/models/promocode_response_model.dart';

abstract class CartRepo {
  Future<String> addAmountOfProductToCart(ProductAmountModel productAmountModel);

  Future<String> deleteAmountOfProductFromCart(
      ProductAmountModel productAmountModel);
  Future<dynamic> getCart();
  Future<dynamic> getCitiesDeliveryPrices();
  Future<PromoCodeResponseModel> addPromoCodeToCart(PromoCodeRequestModel promoCodeModel);
  Future<String> deletePromoCodeFromCart(PromoCodeRequestModel promoCodeModel);
  Future<String> orderTheCart (OrderTheCartModel orderTheCartModel);
}

class CartRepoImp implements CartRepo{
  final CartRDS cartRDS;

  CartRepoImp({required this.cartRDS});
  @override
  Future<String> addAmountOfProductToCart(ProductAmountModel productAmountModel) async {
    return await cartRDS.addAmountOfProductToCart(productAmountModel);
  }
  @override
  Future<String> deleteAmountOfProductFromCart(ProductAmountModel productAmountModel) async {
    return await cartRDS.deleteAmountOfProductFromCart(productAmountModel);
  }

  @override
  Future<PromoCodeResponseModel> addPromoCodeToCart(PromoCodeRequestModel promoCodeModel) async {
    return await cartRDS.addPromoCodeToCart(promoCodeModel);
  }
  @override
  Future<String> deletePromoCodeFromCart(PromoCodeRequestModel promoCodeModel) async {
    return await cartRDS.deletePromoCodeFromCart(promoCodeModel);
  }

  @override
  Future getCart() async{
    return await cartRDS.getCart();
  }

  @override
  Future<dynamic> getCitiesDeliveryPrices() async{
    return await cartRDS.getCitiesDeliveryPrices();
  }

  @override
  Future<String> orderTheCart (OrderTheCartModel orderTheCartModel)  async {
    return await cartRDS.orderTheCart(orderTheCartModel);
  }
}