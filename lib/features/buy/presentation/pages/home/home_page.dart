import 'package:ecom/features/buy/presentation/cubit/product/product_cubit.dart';
import 'package:ecom/features/buy/presentation/cubit/product/product_state.dart';
import 'package:ecom/features/buy/presentation/pages/home/category_page.dart';
import 'package:ecom/features/buy/presentation/pages/home/detail_page.dart';
import 'package:ecom/features/buy/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/utils.dart';

import '../../../data/model/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String myImage =
      'https://www.elegantthemes.com/blog/wp-content/uploads/2022/01/lazy-loading.png';
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: SizedBox(
        width:
            MediaQuery.of(context).size.width > 1200 ? 1200 : double.infinity,
        child:
            BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
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
              trendingSlide(context.read<ProductCubit>().myModel),

              sectionText('Categories'),
              categorySlide(context, context.read<ProductCubit>().myModel),

              //Featured productss
              sectionText('Featured Products'),
              featuredProducts(context.read<ProductCubit>().myModel),
            ],
          );
        }),
      ),
    )));
  }

  SliverToBoxAdapter categorySlide(
      BuildContext context, List<ProductModel>? myModel) {
    var catagoriesList = [
      "men's clothing",
      "jewelery",
      "electronics",
      "women's clothing"
    ];
    return SliverToBoxAdapter(
        child: SizedBox(
            height: 60.0,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(catagoriesList.length, (productIndex) {
                  if (catagoriesList[productIndex] == catagoriesList[0] ||
                      catagoriesList[productIndex] == catagoriesList[1] ||
                      catagoriesList[productIndex] == catagoriesList[2] ||
                      catagoriesList[productIndex] == catagoriesList[3]) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to category page
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CategoryPage(
                              category: catagoriesList[productIndex]);
                        }));
                      },
                      child: Container(
                          width: 180,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13)),
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          padding: const EdgeInsets.all(15.0),
                          alignment: Alignment.center,
                          child: CustomText(
                            text: catagoriesList[productIndex].toString(),
                          )),
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
              ),
            )));
  }

  SliverToBoxAdapter trendingSlide(List<ProductModel>? myModel) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 250.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: myModel?.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                if (myModel != null) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DetailPage(myProduct: myModel[index]);
                    },
                  ));
                }
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
                      myModel?[index].image.toString() ?? myImage),
                ),
              ).marginSymmetric(horizontal: 10),
            );
          },
        ),
      ),
    );
  }

  SliverGrid featuredProducts(List<ProductModel>? myModel) {
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
                return DetailPage(myProduct: myModel?[index] ?? ProductModel());
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
                    myModel?[index].image.toString() ?? myImage,
                    height: 190,
                    width: 200,
                  ),
                  CustomText(
                    maxlines: 2,
                    size: 16,
                    fontweight: FontWeight.w500,
                    text: myModel?[index].title ??
                        'https://www.elegantthemes.com/blog/wp-content/uploads/2022/01/lazy-loading.png',
                  ).marginOnly(top: 10),
                  const Gap(10),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_half,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      Gap(10),
                      CustomText(
                        size: 16,
                        color: Colors.brown.shade700,
                        text: myModel?[index].rating!.rate!.toString() ?? '',
                      ),
                      CustomText(
                        size: 16,
                        text: ('/5 (${myModel?[index].rating!.count!})'),
                      ),
                    ],
                  )
                ],
              ).marginSymmetric(horizontal: 10, vertical: 16),
            ).marginSymmetric(horizontal: 10),
          );
        },
        childCount: (myModel?.length ?? 0) <= 6
            ? myModel?.length
            : 6, // Assuming 6 featured products
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

  List<Widget> categoryItemSection(
    ProductLoadedState state,
    String categoryName,
  ) {
    return [];
  }
}
