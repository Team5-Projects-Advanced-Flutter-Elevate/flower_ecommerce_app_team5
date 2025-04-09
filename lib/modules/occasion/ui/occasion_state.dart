import '../domain/entities/get_occasion.dart';

sealed class OccasionState {}

class OccasionInitial extends OccasionState {}

class OccasionLoading extends OccasionState {}

class OccasionSuccess extends OccasionState {
  final List<Occasion> allOccasions;
  final List<Occasion> filteredOccasions;
  final String selectedSlug;


  OccasionSuccess(this.allOccasions,this.filteredOccasions,this.selectedSlug);
}

class OccasionError extends OccasionState {
  final String message;

  OccasionError(this.message);
}
