import '../../data/data_sources/Cart_rds.dart';
import '../../data/models/product_amount_model.dart';

abstract class CartRepo {
  Future<String> addAmountOfProductToCart(ProductAmountModel productAmountModel);
  Future<dynamic> getCart();
}

class CartRepoImp implements CartRepo{
  final CartRDS cartRDS;

  CartRepoImp({required this.cartRDS});
  @override
  Future<String> addAmountOfProductToCart(ProductAmountModel productAmountModel) async {
    return await cartRDS.addAmountOfProductToCart(productAmountModel);
  }

  @override
  Future getCart() async{
    return await cartRDS.getCart();
  }
}