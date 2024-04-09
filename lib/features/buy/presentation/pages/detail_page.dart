// ignore_for_file: must_be_immutable

import 'package:ecom/features/buy/presentation/widgets/rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:ecom/core/constants/app_color.dart';
import 'package:ecom/features/buy/presentation/widgets/custom_text.dart';
import '../../data/model/product_model.dart';

class DetailPage extends StatefulWidget {
  ProductModel myProduct;
  DetailPage({
    super.key,
    required this.myProduct,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isHeartFilled = false;
  void heartToggle() {
    setState(() {
      isHeartFilled = !isHeartFilled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      bottomNavigationBar: bottomBar(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: CustomText(
          text: 'Product Detail',
          size: 20,
          fontweight: FontWeight.w800,
        ),
        actions: [
          IconButton(
              onPressed: () {
                heartToggle();
              },
              icon: Icon(
                isHeartFilled
                    ? CupertinoIcons.heart_fill
                    : CupertinoIcons.heart,
                size: 24,
                color: isHeartFilled ? AppColor.red : AppColor.black,
              )).marginOnly(right: 10)
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
              child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                    tag: 'heroo',
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            height: 340,
                            width: double.infinity,
                            widget.myProduct.image.toString(),
                            fit: BoxFit.contain,
                          )),
                    )),
                const Divider(
                    thickness: 1.5, color: Color.fromARGB(255, 240, 240, 240)),
                CustomText(
                  text: widget.myProduct.title,
                  size: 18,
                  fontweight: FontWeight.w600,
                ),

                Row(
                  children: [
                    Container(
                      width: 90,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10)),
                      child: CustomText(
                        size: 16,
                        text: '${widget.myProduct.rating!.count!} sold',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    StarRating(
                        rating: widget.myProduct.rating!.rate!.toDouble()),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomText(
                      text: widget.myProduct.rating!.rate!.toString(),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomText(
                      text:
                          '(${widget.myProduct.rating!.count!.toString()} reviews)',
                    )
                  ],
                ).marginOnly(top: 10),
                const Divider(
                        thickness: 1.5,
                        color: Color.fromARGB(255, 240, 240, 240))
                    .marginOnly(top: 10, bottom: 10),

                // CustomText(
                //   text: '\$${widget.myProduct.price}',
                //   size: 20,
                //   color: AppColor.trendUpColor,
                //   fontweight: FontWeight.w800,
                // ).marginOnly(top: 10, bottom: 20),
                CustomText(
                  text: 'Product Description',
                  size: 20,
                  fontweight: FontWeight.w700,
                ),
                CustomText(
                  text: widget.myProduct.description,
                  maxlines: 4,
                  size: 16.5,
                ).marginOnly(top: 10),
              ],
            ).marginOnly(left: 15, right: 15, bottom: 60),
          )),
        ],
      ),
    );
  }

  BottomAppBar bottomBar() {
    return BottomAppBar(
      surfaceTintColor: Colors.transparent,
      padding: const EdgeInsets.all(0),
      height: 70,
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(30, 20),
                topRight: Radius.elliptical(30, 20))),
        child: CustomText(
          text: 'Helo hello',
        ),
      ),
    );
  }
}
