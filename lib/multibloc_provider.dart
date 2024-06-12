import 'package:ecom/features/buy/presentation/cubit/cart/cart_cubit.dart';
import 'package:ecom/features/buy/presentation/cubit/product/product_cubit.dart';
import 'package:ecom/features/offline/presentation/cubit/offline_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'service_locator.dart';

class MultiBlocProviderClass extends StatelessWidget {
  final Widget child;
  const MultiBlocProviderClass(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ProductCubit>(
        create: (_) => ProductCubit(sl()),
      ),

      

      BlocProvider<CartCubit>(
        create: (_) => CartCubit(),
      ),
      BlocProvider<OfflineCubit>(
        create: (_) => OfflineCubit(sl()),
      ),

      //-------Cubits
    ], child: child);
  }
}
