import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../cubit/product/product_cubit.dart';
import '../../cubit/product/product_state.dart';
import '../../widgets/custom_text.dart';

class CategoryPage extends StatefulWidget {
  final String category;

  const CategoryPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: widget.category,
            size: 18,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return CircularProgressIndicator();
            } else if (state is ProductLoadedState) {
              final categoryProducts = state.model
                  .where((product) => product.category == widget.category)
                  .toList();

              return ListView.builder(
                itemCount: categoryProducts.length,
                itemBuilder: (context, index) {
                  final product = categoryProducts[index];
                  return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            image: NetworkImage(
                              product.image.toString(),
                            ),
                            height: 90,
                          ),
                          const Gap(15),
                          Container(
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: product.title.toString(),
                                  maxlines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                                CustomText(
                                  text: '\$${product.price}',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
                },
              );
            } else if (state is ProductErrorState) {
              return Center(
                child: Text(state.message),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
