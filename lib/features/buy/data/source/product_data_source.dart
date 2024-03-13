import 'package:dartz/dartz.dart';
import 'package:ecom/core/constants/apis.dart';
import 'package:ecom/core/network/network.dart';
import 'package:ecom/features/buy/data/model/product_model.dart';

import '../../../../core/error/failure.dart';

class ProducDataSource {
  final Network _network;

  ProducDataSource({required Network network}) : _network = network;

  Future<Either<AppErrorHandler?, List<ProductModel>?>> getProducts() async {
    try {
      var response = await _network.getList<List<ProductModel>>(Uri.parse(ApiEndpoint.getProducts));

      if (response.isValue) {
        return right(response.value);
      } else {
        return left(response.error);
      }
    } catch (e) {
      return left(AppErrorHandler(message: e.toString(), status: false));
    }
  }
}
