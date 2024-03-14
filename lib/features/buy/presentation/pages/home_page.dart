import 'package:ecom/core/constants/app_color.dart';
import 'package:ecom/features/buy/presentation/cubit/product_cubit.dart';
import 'package:ecom/features/buy/presentation/cubit/product_state.dart';
import 'package:ecom/features/buy/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/utils.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _topSection(),
            _searchBar().marginOnly(top: 20),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoadingState) {
                  return CircularProgressIndicator();
                } else if (state is ProductLoadedState) {
                  return Expanded(
                      child: ListView.builder(
                    itemCount: state.model.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.model[index].title!.split('-').first),
                      );
                    },
                  ));
                } else if (state is ProductErrorState) {
                  return Text(state.message);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ).marginOnly(left: 20, right: 20, top: 10),
      ),
    );
  }

  TextField _searchBar() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: IconButton(
            onPressed: () {
              print('tapped');
            },
            icon: const Icon(CupertinoIcons.search)),
        prefixIconColor: AppColor.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
        fillColor: AppColor.greyText,
        filled: true,
      ),
    );
  }

  Row _topSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          content: 'Ecommerce',
          size: 20,
        ),
        const Icon(
          CupertinoIcons.bag,
          size: 25,
        )
      ],
    );
  }
}
