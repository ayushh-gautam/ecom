import 'package:ecom/core/constants/app_color.dart';
import 'package:ecom/features/buy/presentation/cubit/product/product_cubit.dart';
import 'package:ecom/features/buy/presentation/cubit/product/product_state.dart';
import 'package:ecom/features/buy/presentation/pages/home/detail_page.dart';
import 'package:ecom/features/buy/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/utils.dart';

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
            SliverAppBar(
              elevation: 0,
              centerTitle: true,
              title: CustomText(
                text: 'E-Commerce',
                fontweight: FontWeight.w600,
                size: 22,
              ),
              floating: true,
              expandedHeight: 10.0,
            ),
            sectionText('Trending Products'),
            trendingSlide(state),

            sectionText('Categories'),
            categorySlide(context, state),

            //Featured productss
            sectionText('Featured Products'),
            featuredProducts(state),
          ],
        );
      } else if (state is ProductErrorState) {
        return Text(state.message);
      }
      return const CircularProgressIndicator(
        color: Colors.transparent,
      );
    })));
  }

  SliverToBoxAdapter categorySlide(
      BuildContext context, ProductLoadedState state) {
    return SliverToBoxAdapter(
      child: SizedBox(
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(state.model.length, (index) {
              return const Row(children: []);
            }),
          )),
    );
  }

  SliverToBoxAdapter trendingSlide(ProductLoadedState state) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 250.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.model.length - 14,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailPage(myProduct: state.model[index + 14]);
                  },
                ));
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                // clipBehavior: Clip.antiAlias,
                width: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                      width: 190,
                      fit: BoxFit.contain,
                      state.model[index + 14].image.toString()),
                ),
              ).marginSymmetric(horizontal: 10),
            );
          },
        ),
      ),
    );
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
                      Icon(
                        Icons.star_half,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      CustomText(
                        size: 14,
                        color: Colors.brown.shade700,
                        text: state.model[index + 12].rating!.rate!.toString(),
                      ),
                      CustomText(
                        size: 12,
                        text:
                            ('/5 (${state.model[index + 12].rating!.count!})'),
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