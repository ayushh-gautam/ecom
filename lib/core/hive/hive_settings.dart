import 'package:ecom/core/constants/hive_constants.dart';
import 'package:ecom/features/buy/data/model/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveSetting {
  init() async {
    var path = await getApplicationDocumentsDirectory();
    Hive.init(path.path);
    registerAdapter();

    await Hive.openBox<List<dynamic>?>(HiveConstants.product);
    await Hive.openBox(HiveConstants.dataSync);
    // await Hive.openBox<bool>(HiveConstants.isStored);
  }

  registerAdapter() {
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(RatingAdapter());
  }

  addProductModel(List<ProductModel> model) async {
    var box = await Hive.openBox<List<ProductModel>?>(HiveConstants.product);
    // box.add(model);
    box.put(HiveConstants.product, model);
  }

  Future<List<ProductModel>?> getProductModel() async {
    var box = await Hive.openBox<List<dynamic>?>(HiveConstants.product);
    // Open the box with the appropriate data type (List<dynamic>?)

    var data = box.get(HiveConstants.product);
    // Retrieve data from the box

    if (data != null) {
      // If data is not null, map each dynamic element to ProductModel
      List<ProductModel> productList = data
          .map((dynamic item) => ProductModel.fromJson(item) as ProductModel)
          .toList();
      return productList;
    } else {
      // Handle case when data is null
      return null;
    }
  }

  // Future<Box> newBox(String boxName) async {
  //   var box = await Hive.openBox<dynamic>(boxName);
  //   return box;
  // }
}
