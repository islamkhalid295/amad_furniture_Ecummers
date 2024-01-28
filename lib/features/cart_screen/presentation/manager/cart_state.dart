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
class GetCartLoading extends CartState {}
class GetCartSuccess extends CartState {}
class GetCartError extends CartState {
  final String error;

  GetCartError(this.error);
}
class AddProductToLocalCartSuccsess extends CartState{}

class RemoveProductFromLocalCartSuccsess extends CartState{}