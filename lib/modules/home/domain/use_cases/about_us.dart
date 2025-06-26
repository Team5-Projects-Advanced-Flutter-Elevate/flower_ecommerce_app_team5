import 'package:flower_ecommerce_app_team5/modules/home/domain/repo_contract/about_us.dart';
import 'package:injectable/injectable.dart';

import '../entities/about_us.dart';

@injectable
class AboutUsUseCase {
  AboutUsRepo aboutUsRepo;

  AboutUsUseCase(this.aboutUsRepo);
  Future<AboutUsEntity> call() {
    return aboutUsRepo.loadData();
  }
}
