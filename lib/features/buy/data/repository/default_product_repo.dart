import 'package:dartz/dartz.dart';
import 'package:ecom/core/error/failure.dart';
import 'package:ecom/features/buy/data/model/product_model.dart';
import 'package:ecom/features/buy/data/source/local_product_data_source.dart';
import 'package:ecom/features/buy/data/source/product_data_source.dart';
import 'package:ecom/features/buy/domain/repository/product_repo.dart';

class DefaultProductRepo extends ProductRepository {
  final ProducDataSource _dataSource;
  final LocalProductDataSource _localProductDataSource;
// future changes if the resource source is offline
  DefaultProductRepo({
    required ProducDataSource dataSource,
    required LocalProductDataSource localProductDataSource,
  })  : _dataSource = dataSource,
        _localProductDataSource = localProductDataSource;

  @override
  Future<Either<AppErrorHandler?, List<ProductModel>?>> getProduct() async {
    // var response = await _dataSource.getProducts();

    var response = await _localProductDataSource.getOfflineProducts();
    return response;
  }
}
