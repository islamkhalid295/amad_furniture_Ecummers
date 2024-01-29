import 'package:amad_furniture/core/utils/constantes.dart';
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
  static List<ProductInfo>? cart ;


  void removeProductFromLocalCart (ProductInfo product)
  {
    cart?.remove(product);
    emit(RemoveProductFromLocalCartSuccsess());
  }

  Future<String> addAmountOfProductToCart ({required ProductAmountModel productAmountModel}) async {
    emit(AddAmountOfProductToCartLoading());
    try {
      String message = await cartRepo.addAmountOfProductToCart(productAmountModel);
      cart?.add(CategoriesCubit.productInfo!);
      emit(AddAmountOfProductToCartSuccess());
      return message;
    }on DioException catch (e) {
      emit(AddAmountOfProductToCartError(e.response?.data['message']));
      return e.response?.data['message'];
    }
  }

  Future<String> deleteAmountOfProductToCart ({required ProductAmountModel productAmountModel}) async {
    emit(DeleteAmountOfProductToCartLoading());
    try {
      String message = await cartRepo.deleteAmountOfProductToCart(productAmountModel);
      cart?.remove(CategoriesCubit.productInfo!);
      emit(DeleteAmountOfProductToCartSuccess());
      return message;
    }on DioException catch (e) {
      emit(DeleteAmountOfProductToCartError(e.response?.data['message']));
      return e.response?.data['message'];
    }
  }


  static CartModel? cartModel;
   Future<void> getCart() async {
     if (token != null && token != 'null'){
      emit(GetCartLoading());
      try {
        var response = await cartRepo.getCart();
        cartModel = CartModel.fromJson(response);
        cart = cartModel!.cart!.products!
            .map((e) => ProductInfo(id: e.id))
            .toList();
        emit(GetCartSuccess());
      } on DioException catch (e) {
        emit(GetCartError(e.response?.data['message']));
      }
    }
  }
}
