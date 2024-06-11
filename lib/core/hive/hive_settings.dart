import 'package:ecom/features/buy/data/model/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveSetting {
  init() async {
    await Hive.initFlutter();
    registerAdapter();
    await Hive.openBox<ProductModel>("product");
  }

  registerAdapter() {
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(RatingAdapter());
  }

  add(ProductModel model) async {
    var box = await Hive.openBox<ProductModel>("product");
    box.add(model);
  }
}
