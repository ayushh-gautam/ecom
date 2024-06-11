import 'package:ecom/core/hive/hive_settings.dart';
import 'package:ecom/features/offline/presentation/cubit/offline_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import 'core/network/default_network.dart';
import 'core/network/network.dart';

// import 'features/login/injection/login_injection_container.dart';
import 'package:http/http.dart' as http;

import 'features/buy/product_injection_container.dart';

final sl = GetIt.instance;

setupLocators() async {
  //
  sl.registerLazySingleton<http.Client>(() => http.Client());
  // sl.registerLazySingleton<HiveInterface>(() => Hive);
  sl.registerLazySingleton<HiveSetting>(() => HiveSetting());

  sl.registerSingleton<Network>(DefaultNetwork(sl()));

  // login Injection Container

  ProductInjectionContainer().register();
  sl.registerFactory<OfflineCubit>(() => OfflineCubit(sl()));
}
