import '../entities/get_occasion.dart';

abstract class OccasionRepo {
  Future<List<Occasion>> getOccasion();
}
