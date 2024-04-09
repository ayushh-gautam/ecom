import 'package:ecom/features/buy/data/model/product_model.dart';
import 'package:ecom/features/buy/presentation/cubit/product_cubit.dart';
import 'package:ecom/features/buy/presentation/cubit/product_state.dart';
import 'package:ecom/features/buy/presentation/pages/detail_page.dart';
import 'package:ecom/features/buy/presentation/pages/loading_page.dart';
import 'package:ecom/features/buy/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/utils.dart';

import '../widgets/rating.dart';

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
    return SafeArea(child: Scaffold(body:
        BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      if (state is ProductLoadingState) {
      } else if (state is ProductLoadedState) {
        return CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('E-Commerce App'),
              floating: true,
              expandedHeight: 10.0,
            ),
            sectionText('Trending Products'),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, //
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to product details page
                      },
                      child: Container(
                        width: 150.0,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        color: Colors.orange[100 * ((index % 9) + 1)],
                        alignment: Alignment.center,
                        child: Text('Trending Product $index'),
                      ),
                    );
                  },
                ),
              ),
            ),

            sectionText('Categories'),
            SliverToBoxAdapter(
              child: SizedBox(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(state.model.length, (index) {
                      print(state.model[index].category);
                      return const Row(children: []);
                    }),
                  )),
            ),

            //Featured productss
            sectionText('Featured Products'),
            featuredProducts(state),
          ],
        );
      } else if (state is ProductErrorState) {
        return Text(state.message);
      }
      return const LoadingPage();
    })));
  }

  SliverGrid featuredProducts(ProductLoadedState state) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.66,
        crossAxisCount: 2,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 1.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (builder) {
                return DetailPage(myProduct: state.model[index + 12]);
              }));
            },
            child: Container(
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    state.model[index + 12].image.toString(),
                    height: 190,
                    width: 200,
                  ),
                  CustomText(
                    maxlines: 2,
                    size: 16,
                    fontweight: FontWeight.w500,
                    text: state.model[index + 12].title,
                  ).marginOnly(top: 10),
                  Row(
                    children: [
                      StarRating(
                          rating:
                              state.model[index + 12].rating!.rate!.toDouble()),
                      CustomText(
                        size: 12,
                        text: state.model[index + 12].rating!.rate!.toString(),
                      ),
                      CustomText(
                        size: 12,
                        text: ('/(${state.model[index + 12].rating!.count!})'),
                      ),
                    ],
                  )
                ],
              ).marginSymmetric(horizontal: 10, vertical: 16),
            ).marginSymmetric(horizontal: 10),
          );
        },
        childCount: 6, // Assuming 6 featured products
      ),
    );
  }

  SliverToBoxAdapter sectionText(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  List<Widget>? categoryItemSection(
      ProductLoadedState state, String categoryName, int index) {
    List.generate(state.model.length, (productIndex) {
      if (state.model[productIndex].category == categoryName) {
        print(categoryName);
        return GestureDetector(
          onTap: () {
            // Navigate to category page
          },
          child: Container(
            height: 300,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(13)),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child: Image.network(
              state.model[0].image.toString(),
              height: 200,
              width: 200,
            ),
          ),
        );
      } else {
        return const SizedBox();
      }
    });
    return null;
  }
}
