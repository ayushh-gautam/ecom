// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:ecom/features/buy/data/model/product_model.dart';

import 'package:ecom/features/buy/domain/repository/product_repo.dart';
import 'package:ecom/features/buy/presentation/cubit/product/product_state.dart';
import 'package:ecom/features/offline/presentation/cubit/offline_cubit.dart';

import '../../../../../service_locator.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(
    this._productRepository,
  ) : super(ProductInitState());
  final ProductRepository _productRepository;

  List<ProductModel> myModel = [];
  Future<ProductModel?> getProduct() async {
    emit(ProductLoadingState());
    var response = await _productRepository.getProduct();
    response.fold((l) {
      // print(l!.message);

      emit(ProductErrorState(message: l.toString()));
    }, (r) {
      myModel = r ?? [];

      emit(ProductLoadedState(model: r!));
      return r;
    });
  }
}
