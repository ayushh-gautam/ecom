import 'package:ecom/core/constants/app_color.dart';
import 'package:ecom/features/buy/presentation/cubit/product_cubit.dart';
import 'package:ecom/features/buy/presentation/cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    print('yay');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ecom'),
      ),
      body: Column(
        children: [
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoadingState) {
                return Text('Hehehehe');
              } else if (state is ProductLoadedState) {
                return Expanded(
                    child: ListView.builder(
                  itemCount: state.model.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.model[index].title!),
                    );
                  },
                ));
              } else {
                return Container(
                  color: AppColor.cyan,
                  margin: const EdgeInsets.all(30),
                  height: 40,
                  width: double.infinity,
                  child: const Center(
                    child: Text("error "),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
