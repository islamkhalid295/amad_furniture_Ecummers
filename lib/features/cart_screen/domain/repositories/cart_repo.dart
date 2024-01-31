import '../../data/data_sources/Cart_rds.dart';
import '../../data/models/product_amount_model.dart';

abstract class CartRepo {
  Future<String> addAmountOfProductToCart(ProductAmountModel productAmountModel);

  Future<String> deleteAmountOfProductToCart(
      ProductAmountModel productAmountModel);
  Future<dynamic> getCart();
  Future<dynamic> getCitiesDeliveryPrices();
}

class CartRepoImp implements CartRepo{
  final CartRDS cartRDS;

  CartRepoImp({required this.cartRDS});
  @override
  Future<String> addAmountOfProductToCart(ProductAmountModel productAmountModel) async {
    return await cartRDS.addAmountOfProductToCart(productAmountModel);
  }
  Future<String> deleteAmountOfProductToCart(ProductAmountModel productAmountModel) async {
    return await cartRDS.deleteAmountOfProductToCart(productAmountModel);
  }

  @override
  Future getCart() async{
    return await cartRDS.getCart();
  }

  @override
  Future<dynamic> getCitiesDeliveryPrices() async{
    return await cartRDS.getCitiesDeliveryPrices();
  }
}