import 'package:ecom/features/buy/data/model/product_model.dart';
import 'package:ecom/features/buy/presentation/cubit/product_cubit.dart';
import 'package:ecom/features/buy/presentation/cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
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
              expandedHeight: 200.0,
            ),
            sectionText('Categories'),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.model.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (state.model[index].category ==
                        Category.JEWELERY) {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to category page
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13)),
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          padding: const EdgeInsets.all(15.0),
                          alignment: Alignment.center,
                          child: Image.network(
                              state.model[index].image.toString()),
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
            ),

            //Featured productss
            sectionText('Featured Products'),
            featuredProducts(state),
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
          ],
        );
      } else if (state is ProductErrorState) {
        return Text(state.message);
      }
      return CircularProgressIndicator();
    })));
  }

  SliverGrid featuredProducts(ProductLoadedState state) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Navigate to product details page
            },
            child: Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 20),
                child: Image.network(state.model[index].image.toString()),
              ),
            ),
          );
        },
        childCount: state.model.length, // Assuming 6 featured products
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
}
