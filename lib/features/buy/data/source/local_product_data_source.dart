import 'package:dartz/dartz.dart';
import 'package:ecom/core/error/failure.dart';
import 'package:ecom/core/hive/hive_settings.dart';
import 'package:ecom/features/buy/data/model/product_model.dart';

class LocalProductDataSource {
  final HiveSetting hiveSetting;

  LocalProductDataSource({required this.hiveSetting});

  Future<Either<AppErrorHandler?, List<ProductModel>?>>
      getOfflineProducts() async {
    var response = await hiveSetting.getProductModel();
    if (response != null) {
      return right(response);
    } else {
      return left(AppErrorHandler(message: 'data aayena ', status: false));
    }
  }
}
