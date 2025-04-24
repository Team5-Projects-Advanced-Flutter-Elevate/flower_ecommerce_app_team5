import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/terms.dart';

abstract class TermsLocalDataSource {
  Future<GetTermsEntity> loadData();
}
