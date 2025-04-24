import 'package:flower_ecommerce_app_team5/modules/home/data/datasource_contract/about_us.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/repo_contract/about_us.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/about_us.dart';

@Injectable(as: AboutUsRepo)
class AboutUsRepoImpl implements AboutUsRepo {
  AboutUsLocalDataSource aboutUsLocalDataSource;
  AboutUsRepoImpl(this.aboutUsLocalDataSource);
  @override
  Future<AboutUsEntity> loadData() {
    return aboutUsLocalDataSource.loadData();
  }
}
