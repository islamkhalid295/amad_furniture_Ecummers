import 'package:amad_furniture/core/use_case/use_case.dart';
import '../../data/models/product_amount_model.dart';
import '../repositories/cart_repo.dart';



class AddAmountOfProductToCartUC extends UseCase<String,ProductAmountModel> {
  final CartRepo cartRepo;

  AddAmountOfProductToCartUC({required this.cartRepo});
  @override
  Future<String> call(ProductAmountModel productAmountModel) async {
    return await cartRepo.addAmountOfProductToCart(productAmountModel);
  }
}
