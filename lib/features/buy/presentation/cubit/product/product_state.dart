import 'package:ecom/features/buy/data/model/product_model.dart';

sealed class ProductState {}

class ProductInitState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductErrorState extends ProductState {
  final String message;

  ProductErrorState({required this.message});
}

class ProductLoadedState extends ProductState {
  final List<ProductModel> model;

  ProductLoadedState({required this.model});
}
