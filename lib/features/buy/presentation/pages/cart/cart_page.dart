import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecom/features/buy/presentation/widgets/custom_text.dart';
import 'package:gap/gap.dart';
import 'package:get/utils.dart';
import '../../cubit/cart/cart_cubit.dart';
import '../../cubit/cart/cart_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: 'Cart',
        ),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return Center(
              child: CustomText(
                text: 'No items added',
              ),
            );
          }
          return ListView.builder(
            itemCount: state.cartItems.length,
            itemBuilder: (context, index) {
              final product = state.cartItems[index];

              return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(14),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: product.title!.split(' ').first,
                            maxlines: 3,
                          ),
                          CustomText(
                            text: '\$${product.price}',
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          context.read<CartCubit>().deleteCart(product);
                        },
                        child: const Icon(
                          Icons.delete,
                          size: 30,
                          color: Colors.red,
                        ),
                      )
                    ],
                  )).marginSymmetric(horizontal: 16, vertical: 10);
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            double subtotal = 0;
            for (var product in state.cartItems) {
              subtotal += product.price!;
            }
            return Container(
              height: 50,
              alignment: Alignment.center,
              color: Colors.grey.shade300,
              child: CustomText(
                text: 'Subtotal: \$${subtotal.toStringAsFixed(2)}',
                size: 18,
                fontweight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }
}
