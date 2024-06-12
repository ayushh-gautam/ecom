import 'package:bloc/bloc.dart';
import 'package:ecom/core/constants/hive_constants.dart';
import 'package:ecom/core/hive/hive_settings.dart';
import 'package:ecom/features/buy/data/model/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'offline_state.dart';

class OfflineCubit extends Cubit<OfflineState> {
  OfflineCubit(this.hiveSetting) : super(OfflineInitial());
  final HiveSetting hiveSetting;

  Future saveData(List<ProductModel> model) async {
    hiveSetting.addProductModel(model);
  }

  Future<bool> dataSync() async {
    var storedData = await Hive.openBox(HiveConstants.dataSync);
    if (storedData.get('refreshDate')?.isBefore(DateTime.now()) ??
        false || !(storedData.get("isStored") ?? false)) {
      print(storedData.get('refreshDate'));
      var date = DateTime.now();
      var newDate = date.add(const Duration(minutes: 1));
      storedData.put('refreshDate', newDate);
      storedData.put('isStored', true);

      return true;
    } else {
      print('oops');
      return false;
    }
  }
}
