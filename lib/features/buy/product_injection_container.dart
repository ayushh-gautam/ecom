

import 'package:ecom/features/buy/data/source/product_data_source.dart';
import 'package:ecom/features/buy/domain/repository/product_repo.dart';
import 'package:ecom/features/buy/presentation/cubit/product/product_cubit.dart';

import '../../service_locator.dart';
import 'data/repository/default_product_repo.dart';

class ProductInjectionContainer{
   void register() {    
    //data Source
    sl.registerLazySingleton<ProducDataSource>(
        () => ProducDataSource(network: sl()));
    // repository
    sl.registerLazySingleton<ProductRepository>(() => DefaultProductRepo(dataSource: sl()));

    // bloc
    sl.registerFactory<ProductCubit>(() => ProductCubit(sl()));
  }
}