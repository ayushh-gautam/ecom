// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({
    Key? key,
    required this.imageUrl,
    required this.boxFit,
    required this.height,
    required this.width,
    this.color,
    this.blendMode,
    this.errorWidget,
  }) : super(key: key);
  final String imageUrl;
  final BoxFit boxFit;
  final double height;
  final double width;
  final Color? color;
  final Widget? errorWidget;
  final BlendMode? blendMode;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl, //const Color.fromRGBO(0, 0, 0, 0.2),
        fit: boxFit,
        height: height,
        width: width,
        color: color, // Adjust the last value (opacity) as needed
        colorBlendMode: blendMode,
        placeholder: (context, url) =>
            const SizedBox(), // Placeholder widget while the image is loading
        errorWidget: (context, url, error) =>
            errorWidget ??
            // SvgPicture.asset(
            //   SvgAssets.profilePlaceholder,
            //   color: Colors.black,
            //   fit: boxFit,
            //   height: height,
            //   width: width,
            // ), // Widget to display in case of an error
            Image.network(
                'https://i.pinimg.com/736x/3f/cd/17/3fcd1785622d5eea86a236d9ad795fba.jpg',
                fit: BoxFit.cover,
                height: 36,
                width: 36));
  }
}
