import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/occasion/domain/use_cases/occasion_usecase.dart';
import 'package:injectable/injectable.dart';
import '../../home/data/models/all_products_response/all_product_response.dart';
import '../domain/entities/get_occasion.dart';
import 'occasion_state.dart';

@injectable
class OccasionViewModelCubit extends Cubit<OccasionState> {
  OccasionViewModelCubit(this.occasionUseCase) : super(OccasionInitial());
  final OccasionUseCase occasionUseCase;

  List<Occasion> _allOccasions = [];
  List<ProductEntity> _allProducts = [];

  Future<void> _handleOccasionList() async {
    try {
      emit(OccasionLoading());
      _allOccasions = await occasionUseCase.getOccasion();
      final productResponseEntity = await occasionUseCase.execute();
      _allProducts = productResponseEntity.products??[];
      final defaultID = _allOccasions.first.id;
      final filtered =
          _allProducts.where((e) => e.occasion == defaultID).toList();
      emit(OccasionSuccess(
        _allOccasions,
        filtered,
        defaultID,
      ));
    } catch (e) {
      emit(OccasionError(e.toString()));
    }
  }

  Future<void> _filterProductById(String occasionId) async {
    try {
      final filtered =
          _allProducts.where((e) => e.occasion == occasionId).toList();
      emit(OccasionSuccess(
        _allOccasions,
        filtered,
        occasionId,
      ));
    } catch (e) {
      emit(OccasionError(e.toString()));
    }
  }

  void processIntent(OccasionIntent intent) {
    switch (intent) {
      case LoadFilterIntent():
        _filterProductById(intent.occasionId);
        break;
      case LoadOccasionIntent():
        _handleOccasionList();
        break;
    }
  }
}

sealed class OccasionIntent {}

class LoadFilterIntent extends OccasionIntent {
  final String occasionId;
  LoadFilterIntent(this.occasionId);
}

class LoadOccasionIntent extends OccasionIntent {}
