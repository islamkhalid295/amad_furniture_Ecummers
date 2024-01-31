import '../../data/data_sources/Cart_rds.dart';
import '../../data/models/order_data.dart';
import '../../data/models/product_amount_model.dart';
import '../../data/models/promocode_model.dart';

abstract class CartRepo {
  Future<String> addAmountOfProductToCart(ProductAmountModel productAmountModel);

  Future<String> deleteAmountOfProductFromCart(
      ProductAmountModel productAmountModel);
  Future<dynamic> getCart();
  Future<dynamic> getCitiesDeliveryPrices();
  Future<String> addPromoCodeToCart(PromoCodeModel promoCodeModel);
  Future<String> deletePromoCodeFromCart(PromoCodeModel promoCodeModel);
  Future<String> orderTheCart (OrderData orderData);
}

class CartRepoImp implements CartRepo{
  final CartRDS cartRDS;

  CartRepoImp({required this.cartRDS});
  @override
  Future<String> addAmountOfProductToCart(ProductAmountModel productAmountModel) async {
    return await cartRDS.addAmountOfProductToCart(productAmountModel);
  }
  Future<String> deleteAmountOfProductFromCart(ProductAmountModel productAmountModel) async {
    return await cartRDS.deleteAmountOfProductFromCart(productAmountModel);
  }

  @override
  Future<String> addPromoCodeToCart(PromoCodeModel promoCodeModel) async {
    return await cartRDS.addPromoCodeToCart(promoCodeModel);
  }
  Future<String> deletePromoCodeFromCart(PromoCodeModel promoCodeModel) async {
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
  Future<String> orderTheCart (OrderData orderData)  async {
    return await cartRDS.orderTheCart(orderData);
  }
}