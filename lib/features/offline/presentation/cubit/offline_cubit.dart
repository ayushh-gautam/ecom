import 'package:bloc/bloc.dart';
import 'package:ecom/core/hive/hive_settings.dart';
import 'package:ecom/features/buy/data/model/product_model.dart';
import 'package:equatable/equatable.dart';

part 'offline_state.dart';

class OfflineCubit extends Cubit<OfflineState> {
  OfflineCubit(this.hiveSetting) : super(OfflineInitial());
  final HiveSetting hiveSetting;

  Future saveData(ProductModel model) async {
    hiveSetting.add(model);
  }
}
