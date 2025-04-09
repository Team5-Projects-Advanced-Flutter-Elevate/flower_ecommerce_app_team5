import 'package:flower_ecommerce_app_team5/modules/occasion/data/models/get_occasion.dart';
import '../../domain/entities/get_occasion.dart';

abstract class OccasionOnlineDataSource {
  Future<List<Occasion>> getOccasion();
}
