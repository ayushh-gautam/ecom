import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CustomText(
          text: 'coming soon..',
        ),
      ),
    );
  }
}
