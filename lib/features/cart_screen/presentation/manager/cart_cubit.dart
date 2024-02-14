import 'package:amad_furniture/core/utils/constantes.dart';
import 'package:amad_furniture/features/cart_screen/data/models/cart_model.dart';
import 'package:amad_furniture/features/cart_screen/data/models/city_model.dart';
import 'package:amad_furniture/features/cart_screen/data/models/order_the_cart_model.dart';
import 'package:amad_furniture/features/cart_screen/domain/repositories/cart_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../products_screen/data/models/product_info_model.dart';
import '../../data/models/product_amount_model.dart';
import '../../data/models/promocode_request_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
 final CartRepo cartRepo;
  static List<ProductInfo>? cart ;
  static var formKey = GlobalKey<FormState>();
  static String? cityDropDownMenuError;
  static TextEditingController cityDropDownMenuController = TextEditingController();
static City? deliveryCity;
static TextEditingController clientCoponController = TextEditingController();
static TextEditingController sellerCoponController = TextEditingController();
  static FormFieldValidator<String> emailValidator = (value) {
    if (value!.isEmpty) {
      return 'يجب ادخال البريد الإلكتروني';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  };
  static FormFieldValidator<String> nameValidator = (value) {
    if (value!.isEmpty) {
      return 'يجب ملئ هذا الحقل';
    } else {
      return null;
    }
  };
  static FormFieldValidator<String> phoneValidator = (value) {
    if (value!.isEmpty) {
      return 'يجب ادخال رقم الهاتف';
    } else if (!RegExp(r'^\+\d{1,4}\d{6,}$').hasMatch(value)) {
      return 'يرجي ادخال كود الدولة متبوعاً برقم الهاتف +20115222222';
    } else {
      return null;
    }
  };
  static FormFieldValidator<String> anotherPhoneValidator = (value) {
    if (value!.isEmpty) {
      return null;
    } else if (!RegExp(r'^\+\d{1,4}\d{6,}$').hasMatch(value)) {
      return 'يرجي ادخال كود الدولة متبوعاً برقم الهاتف +20115222222';
    } else {
      return null;
    }
  };

  // void removeProductFromLocalCart (ProductInfo product)
  // {
  //   cart?.remove(product);
  //   emit(RemoveProductFromLocalCartSuccsess());
  // }

  Future<String> addAmountOfProductToCart ({required ProductAmountModel productAmountModel}) async {
    emit(AddAmountOfProductToCartLoading());
    try {
      String message = await cartRepo.addAmountOfProductToCart(productAmountModel);
      emit(AddAmountOfProductToCartSuccess());
      getCart();
      return message;
    }on DioException catch (e) {
      emit(AddAmountOfProductToCartError(e.response?.data['message']));
      return e.response?.data['message'];
    }
  }

  Future<String> deleteAmountOfProductFromCart ({required ProductAmountModel productAmountModel}) async {
    emit(DeleteAmountOfProductToCartLoading());
    try {
      String message = await cartRepo.deleteAmountOfProductFromCart(productAmountModel);
      // cart?.remove(CategoriesCubit.productInfo!);
      emit(DeleteAmountOfProductToCartSuccess());
      getCart();
      return message;
    }on DioException catch (e) {
      emit(DeleteAmountOfProductToCartError(e.response?.data['message']));
      return e.response?.data['message'];
    }
  }

  Future<void> addClientPromocodetoCart({required PromoCodeRequestModel promoCodeModel}) async {
    emit(AddClientPromoCodeToCartLoading());
    try {
       await cartRepo.addPromoCodeToCart(promoCodeModel);
      emit(AddClientPromoCodeToCartSuccess());
      getCart();

    }on DioException catch (e) {
      emit(AddClientPromoCodeToCartError(e.response?.data['message']));

    }
  }
  Future<void> addSellerPromocodetoCart({required PromoCodeRequestModel promoCodeModel}) async {
    emit(AddSellerPromoCodeToCartLoading());
    try {
       await cartRepo.addPromoCodeToCart(promoCodeModel);
      emit(AddSellerPromoCodeToCartSuccess());
      getCart();

    }on DioException catch (e) {
      emit(AddSellerPromoCodeToCartError(e.response?.data['message']));
    }
  }

  Future<String> deleteClientPromocodeFromCart ({required PromoCodeRequestModel promoCodeModel}) async {
    emit(DeleteClientPromoCodeFromCartLoading());
    try {
      String message = await cartRepo.deletePromoCodeFromCart(promoCodeModel);
      emit(DeleteClientPromoCodeFromCartSuccess());
      getCart();

      return message;
    }on DioException catch (e) {
      emit(DeleteClientPromoCodeFromCartError(e.response?.data['message']));
      return e.response?.data['message'];
    }
  }
  Future<String> deleteSellerPromocodeFromCart ({required PromoCodeRequestModel promoCodeModel}) async {
    emit(DeleteSellerPromoCodeFromCartLoading());
    try {
      String message = await cartRepo.deletePromoCodeFromCart(promoCodeModel);
      emit(DeleteSellerPromoCodeFromCartSuccess());
      getCart();

      return message;
    }on DioException catch (e) {
      emit(DeleteSellerPromoCodeFromCartError(e.response?.data['message']));
      return e.response?.data['message'];
    }
  }


  static CartModel? cartModel;
  bool cartLoading = false;
   Future<void> getCart() async {
     if (token != null && token != 'null'){
       cartLoading = true;
      emit(GetCartLoading());
      try {
        await cartRepo.getCart().then((value) {
          cartModel = CartModel.fromJson(value);
        cart = cartModel!.cart!.products!
            .map((e) => ProductInfo(id: e.id))
            .toList();
          cartLoading= false;
        emit(GetCartSuccess());});

      } on DioException catch (e) {
        emit(GetCartError(e.response?.data['message']));
      }
    }
  }
static List<City>? cities;
  Future<dynamic> getCitiesDeliveryPrices() async {

      emit(GetCitiesDeliveryPricesLoading());
      try {
        var response = await cartRepo.getCitiesDeliveryPrices();
        CityModel cityModel = CityModel.fromJson(response);
        cities = cityModel.cities;
        emit(GetCitiesDeliveryPricesSuccess());
      } on DioException catch (e) {
        emit(GetCitiesDeliveryPricesError(e.response?.data['message']));
      }

  }

  void cityDropDownMenuValidationError(){
    cityDropDownMenuError = 'يجب ادخال المحافظة';
    emit(ChangeCityDropDownMenuState());

  }
  void onCitySelected(City city){
    deliveryCity = city;
    emit(CitySelectedState());
  }

  Future<String> orderTheCart ({required OrderTheCartModel orderTheCartModel}) async {
    emit(OrderTheCartLoading());
    try {
      String message = await cartRepo.orderTheCart(orderTheCartModel);
      emit(OrderTheCartSuccess());
      return message;
    }on DioException catch (e) {
      emit(OrderTheCartError(e.response?.data['message']));
      return e.response?.data['message'];
    }
  }
 void myTestState (){
    emit(GetCartError("my"));
}
}
