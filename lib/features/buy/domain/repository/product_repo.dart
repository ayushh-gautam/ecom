import 'package:dartz/dartz.dart';
import 'package:ecom/core/error/failure.dart';
import 'package:ecom/features/buy/data/model/product_model.dart';

abstract class ProductRepository{
  Future<Either<AppErrorHandler?, List<ProductModel>?>> getProduct();

  //other functions


}

