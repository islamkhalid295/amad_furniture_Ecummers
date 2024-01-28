import 'package:amad_furniture/features/cart_screen/data/models/cart_model.dart';
import 'package:amad_furniture/features/cart_screen/domain/repositories/cart_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import '../../../home_screen/presentation/widgets/categories_screen/presentation/manager/categories_screen_cubit.dart';
import '../../../products_screen/data/models/product_info_model.dart';
import '../../data/models/product_amount_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
 final CartRepo cartRepo;
  static List<ProductInfo> cart = [];

  void addProductToLocalCart (ProductInfo product){
    cart.add(product);
  }

  void removeProductFromLocalCart (ProductInfo product)
  {
    cart.remove(product);
  }

  Future<String> addAmountOfProductToCart ({required ProductAmountModel productAmountModel}) async {
    emit(AddAmountOfProductToCartLoading());
    try {
      String message = await cartRepo.addAmountOfProductToCart(productAmountModel);
      addProductToLocalCart(
          CategoriesCubit.productInfo!);
      emit(AddAmountOfProductToCartSuccess());
      return message;
    }on DioException catch (e) {
      emit(AddAmountOfProductToCartError(e.response?.data['message']));
      return e.response?.data['message'];
    }
  }
  CartModel? cartModel;
  Future<void> getCart() async {
    emit(GetCartLoading());
    try {
      var response = await cartRepo.getCart();
      cartModel = CartModel.fromJson(response);
      emit(GetCartSuccess());

    }on DioException catch (e) {
      emit(GetCartError(e.response?.data['message']));
    }
  }
}
