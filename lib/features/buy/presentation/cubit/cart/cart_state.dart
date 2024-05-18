import 'package:equatable/equatable.dart';

import '../../../data/model/product_model.dart';

class CartState extends Equatable {
  final List<ProductModel> cartItems;

  CartState({this.cartItems = const []});

  CartState copyWith({List<ProductModel>? cartItems}) {
    return CartState(cartItems: cartItems ?? this.cartItems);
  }

  @override
  List<Object?> get props => [cartItems];
}