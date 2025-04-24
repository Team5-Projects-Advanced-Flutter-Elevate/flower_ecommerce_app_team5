import '../entities/about_us.dart';

abstract class AboutUsRepo {
  Future<AboutUsEntity> loadData();
}
