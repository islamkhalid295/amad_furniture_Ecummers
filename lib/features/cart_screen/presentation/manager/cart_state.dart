part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class AddAmountOfProductToCartLoading extends CartState {}
class AddAmountOfProductToCartSuccess extends CartState {}
class AddAmountOfProductToCartError extends CartState {
  final String error;

  AddAmountOfProductToCartError(this.error);
}

class AddClientPromoCodeToCartLoading extends CartState {}
class AddClientPromoCodeToCartSuccess extends CartState {}
class AddClientPromoCodeToCartError extends CartState {
  final String error;

  AddClientPromoCodeToCartError(this.error);
}
class AddSellerPromoCodeToCartLoading extends CartState {}
class AddSellerPromoCodeToCartSuccess extends CartState {}
class AddSellerPromoCodeToCartError extends CartState {
  final String error;

  AddSellerPromoCodeToCartError(this.error);
}

class DeleteAmountOfProductToCartLoading extends CartState {}
class DeleteAmountOfProductToCartSuccess extends CartState {}
class DeleteAmountOfProductToCartError extends CartState {
  final String error;

  DeleteAmountOfProductToCartError(this.error);
}
class DeleteClientPromoCodeFromCartLoading extends CartState {}
class DeleteClientPromoCodeFromCartSuccess extends CartState {}
class DeleteClientPromoCodeFromCartError extends CartState {
  final String error;

  DeleteClientPromoCodeFromCartError(this.error);
}
class DeleteSellerPromoCodeFromCartLoading extends CartState {}
class DeleteSellerPromoCodeFromCartSuccess extends CartState {}
class DeleteSellerPromoCodeFromCartError extends CartState {
  final String error;

  DeleteSellerPromoCodeFromCartError(this.error);
}

class GetCartLoading extends CartState {}
class GetCartSuccess extends CartState {}
class GetCartError extends CartState {
  final String error;

  GetCartError(this.error);
}

class GetCitiesDeliveryPricesLoading extends CartState {}
class GetCitiesDeliveryPricesSuccess extends CartState {}
class GetCitiesDeliveryPricesError extends CartState {
  final String error;

  GetCitiesDeliveryPricesError(this.error);
}

class AddProductToLocalCartSuccsess extends CartState{}

class RemoveProductFromLocalCartSuccsess extends CartState{}

class ChangeCityDropDownMenuState extends CartState{}
class CitySelectedState extends CartState{}

