// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:ecom/features/buy/domain/repository/product_repo.dart';
import 'package:ecom/features/buy/presentation/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(
    this._productRepository,
  ) : super(ProductInitState());
  final ProductRepository _productRepository;

  Future<void> getProduct() async {
    emit(ProductLoadingState());
    var response = await _productRepository.getProduct();
    response.fold((l) {
      emit(ProductErrorState(message: l!.message.toString()));
    }, (r) {
      emit(ProductLoadedState(model: r!));
    });
  }
}
