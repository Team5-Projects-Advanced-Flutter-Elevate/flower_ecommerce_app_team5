import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/modules/occasion/domain/use_cases/occasion_usecase.dart';
import 'package:injectable/injectable.dart';
import '../domain/entities/get_occasion.dart';
import 'occasion_state.dart';

@injectable
class OcassionViewModelCubit extends Cubit<OccasionState> {
  OcassionViewModelCubit(this.occasionUseCase) : super(OccasionInitial());
  final OccasionUseCase occasionUseCase;

  List<Occasion> _allOccasions = [];

  Future<void> _handleOccasionList() async {
    try {
      emit(OccasionLoading());
      _allOccasions = await occasionUseCase.getOccasion();
      // Default: show all or based on first slug
      final defaultSlug = _allOccasions.first.slug;
      final filtered =
          _allOccasions.where((e) => e.slug == defaultSlug).toList();
      emit(OccasionSuccess(
        _allOccasions,
        filtered,
        defaultSlug,
      ));
    } catch (e) {
      emit(OccasionError(e.toString()));
    }
  }

  Future<void> _filterOccasionBySlug(String slug) async {
    try {
      final filtered = _allOccasions.where((e) => e.slug == slug).toList();
      emit(OccasionSuccess(
        _allOccasions,
        filtered,
        slug,
      ));
    } catch (e) {
      emit(OccasionError(e.toString()));
    }
  }

  void processIntent(OccasionIntent intent) {
    switch (intent) {
      case LoadFilterIntent():
        _filterOccasionBySlug(intent.Slug);
        break;
      case LoadOccasionIntent():
        _handleOccasionList();
        break;
    }
  }
}

sealed class OccasionIntent {}

class LoadFilterIntent extends OccasionIntent {
  final String Slug;
  LoadFilterIntent(this.Slug);
}

class LoadOccasionIntent extends OccasionIntent {}
