import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  final Color color;

  const StarRating({
    Key? key,
    required this.rating,
    this.size = 20,
    this.color = const Color.fromARGB(255, 221, 202, 29),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numberOfStars = rating.toInt();

    List<Widget> stars = List.generate(5, (index) {
      if (index < numberOfStars) {
        return Icon(
          Icons.star,
          color: color,
          size: size,
        );
      } else {
        return Icon(
          Icons.star_border,
          color: color,
          size: size,
        );
      }
    });

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}
