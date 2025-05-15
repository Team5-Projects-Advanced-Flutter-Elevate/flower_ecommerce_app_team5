import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/core/entities/product/product_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/occasion_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/occasion/domain/use_cases/occasion_usecase.dart';
import 'package:injectable/injectable.dart';
import 'occasion_state.dart';

@injectable
class OccasionViewModelCubit extends Cubit<OccasionState> {
  OccasionViewModelCubit(this.occasionUseCase) : super(OccasionInitial());
  final OccasionUseCase occasionUseCase;

  List<OccasionEntity> _allOccasions = [];
  List<ProductEntity> _allProducts = [];
  String? _initialOccasionId;
  String? initialOccasionSlug;

  Future<void> _handleOccasionList() async {
    try {
      emit(OccasionLoading());
      _allOccasions = await occasionUseCase.getOccasion();
      final productResponseEntity = await occasionUseCase.execute();
      _allProducts = productResponseEntity.products ?? [];
      if (initialOccasionSlug != null) {
        final occasionList = _allOccasions
            .where(
              (occasion) => occasion.slug == initialOccasionSlug,
            )
            .toList();
        _initialOccasionId =
            occasionList.isEmpty ? _allOccasions.first.id : occasionList[0].id;
      } else {
        _initialOccasionId = _allOccasions.first.id;
      }
      final filtered =
          _allProducts.where((e) => e.occasion == _initialOccasionId).toList();
      emit(OccasionSuccess(
        _allOccasions,
        filtered,
        _initialOccasionId ?? "",
      ));
    } catch (e) {
      emit(OccasionError(e));
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
