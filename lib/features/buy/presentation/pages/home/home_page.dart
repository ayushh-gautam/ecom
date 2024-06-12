import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/features/buy/presentation/cubit/product/product_cubit.dart';
import 'package:ecom/features/buy/presentation/cubit/product/product_state.dart';
import 'package:ecom/features/buy/presentation/pages/home/category_page.dart';
import 'package:ecom/features/buy/presentation/pages/home/detail_page.dart';
import 'package:ecom/features/buy/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/utils.dart';

import '../../../../offline/presentation/cubit/offline_cubit.dart';
import '../../../data/model/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String myImage =
      'https://www.elegantthemes.com/blog/wp-content/uploads/2022/01/lazy-loading.png';

  void checkDataSaved() async {
    var shouldAdd = await context.read<OfflineCubit>().dataSync();

    await context.read<ProductCubit>().getProduct();
    var myModel = context.read<ProductCubit>().myModel;
    if (myModel != null) {
      if (shouldAdd) {
        print('the data has been stored');
        context.read<OfflineCubit>().saveData(myModel);
      } else {
        print('data will only be stored when the time is right');
      }
    } else {
      print('data will only be stored when the time is right');
    }
  }

  @override
  void initState() {
    super.initState();
    checkDataSaved();
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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            (myModel?.length ?? 0) <= 5 ? (myModel?.length ?? 0) : 5,
            (index) {
              return GestureDetector(
                onTap: () {
                  if (myModel != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailPage(myProduct: myModel[index]);
                        },
                      ),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: myModel?[index].image.toString() ?? myImage,
                        width: 190,
                        height: 200,
                        fit: BoxFit.contain,
                      )),
                ).marginSymmetric(horizontal: 10),
              );
            },
          ),
        ),
      ),
    );
  }

  SliverGrid featuredProducts(List<ProductModel>? myModel) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.6,
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 1.h,
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
