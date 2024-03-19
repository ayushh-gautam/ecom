// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

import 'package:ecom/core/constants/app_color.dart';
import 'package:ecom/features/buy/presentation/widgets/custom_text.dart';

import '../../data/model/product_model.dart';

class DetailPage extends StatefulWidget {
  ProductModel myProduct;
  DetailPage({
    Key? key,
    required this.myProduct,
  }) : super(key: key);

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
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: CustomText(
          text: 'Details',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
              tag: 'heroo',
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    height: 400,
                    width: double.infinity,
                    widget.myProduct.image.toString(),
                    fit: BoxFit.contain,
                  ))).marginOnly(bottom: 40, top: 20),
          CustomText(
            text: widget.myProduct.title,
            size: 20,
            fontweight: FontWeight.w800,
          ),
          CustomText(
            text: '\$${widget.myProduct.price}',
            size: 20,
            color: AppColor.trendUpColor,
            fontweight: FontWeight.w800,
          ).marginOnly(top: 10, bottom: 20),
          CustomText(
            text: 'Product Description',
            size: 20,
            fontweight: FontWeight.w700,
          ),
          CustomText(
            text: widget.myProduct.description,
            maxlines: 4,
            size: 20,
          ).marginOnly(top: 10),
        ],
      ).marginSymmetric(horizontal: 15),
    );
  }
}
