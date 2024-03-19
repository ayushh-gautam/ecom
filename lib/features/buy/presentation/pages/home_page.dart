import 'package:ecom/core/constants/app_color.dart';
import 'package:ecom/features/buy/presentation/cubit/product_cubit.dart';
import 'package:ecom/features/buy/presentation/cubit/product_state.dart';
import 'package:ecom/features/buy/presentation/pages/detail_page.dart';
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
                  return _skeletonWidget();
                } else if (state is ProductLoadedState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 350,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.model.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                          myProduct: state.model[index],
                                        ),
                                      ));
                                },
                                child: SizedBox(
                                  width: 240,
                                  height: 320,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            state.model[index].image.toString(),
                                            height: 290,
                                            width: 290,
                                            fit: BoxFit.fill,
                                          )).marginOnly(bottom: 10),
                                      CustomText(
                                        maxlines: 1,
                                        text: state.model[index].title,
                                      )
                                    ],
                                  ).marginOnly(left: 20, right: 20),
                                ),
                              );
                            },
                          )).marginOnly(top: 30),
                      CustomText(
                        text: 'Explore more',
                      ),
                      SizedBox(
                          height: 400,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300,
                              ),
                              itemCount: state.model.length,
                              itemBuilder: (_, index) {
                                return ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.network(
                                      state.model[index].image.toString(),
                                      height: 290,
                                      width: 290,
                                      fit: BoxFit.fill,
                                    )).marginOnly(bottom: 10).marginAll(10);
                              })),
                    ],
                  );
                } else if (state is ProductErrorState) {
                  return Text(state.message);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ).marginOnly(left: 20, right: 20, top: 10),
      ),
    );
  }

  SizedBox _skeletonWidget() {
    return SizedBox(
      height: 500,
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Center(
              child: Shimmer.fromColors(
                period: const Duration(seconds: 2),
                baseColor: Colors.grey.withOpacity(0.2),
                highlightColor: Colors.black.withOpacity(0.1),
                child: Container(
                  height: 400,
                  width: 310,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(16)),
                ).marginAll(10),
              ),
            );
          })),
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
          text: '',
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
