import 'package:get_it/get_it.dart';

import 'core/network/default_network.dart';
import 'core/network/network.dart';

// import 'features/login/injection/login_injection_container.dart';
import 'package:http/http.dart' as http;

import 'features/buy/product_injection_container.dart';

final sl = GetIt.instance;

setupLocators() async {
  //
  sl.registerLazySingleton<http.Client>(() => http.Client());

  
  sl.registerSingleton<Network>(DefaultNetwork(sl()));

  // login Injection Container
 
  ProductInjectionContainer().register();
}
