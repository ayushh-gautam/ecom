// import 'package:ecom/core/hive/hive.dart';
// import 'package:ecom/features/buy/data/model/product_model.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class DefaultHiveSetting extends HiveSetting {
//   DefaultHiveSetting({required super.hive});

//   @override
//   init() async {
//     hive.initFlutter();
//     await hive.openBox<ProductModel>("product");
//   }

//   @override
//   registerAdapter() {
//     hive.registerAdapter(ProductModelAdapter());
//     hive.registerAdapter(RatingAdapter());
//   }

//   @override
//   add(ProductModel model) async {
//     var box = await hive.openBox<ProductModel>("product");
//     box.add(model);
//   }
// }
