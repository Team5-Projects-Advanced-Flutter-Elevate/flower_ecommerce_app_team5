import '../../domain/entities/about_us.dart';

abstract class AboutUsLocalDataSource {
  Future<AboutUsEntity> loadData();
}
