import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/product_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());

  void addToCart(ProductModel product) {
    final updatedCart = List<ProductModel>.from(state.cartItems)..add(product);
    emit(state.copyWith(cartItems: updatedCart));
  }

  void deleteCart(ProductModel product) {
    final deleteItem = List<ProductModel>.from(state.cartItems)
      ..remove(product);
    emit(state.copyWith(cartItems: deleteItem));
  }
}
