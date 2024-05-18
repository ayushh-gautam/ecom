import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(
          text: 'coming soon..',
        ),
      ),
      appBar: AppBar(),
    );
  }
}
