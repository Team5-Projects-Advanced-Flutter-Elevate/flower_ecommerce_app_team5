import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/terms.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/repo_contract/terms.dart';
import 'package:injectable/injectable.dart';

@injectable
class TermsUseCase {
  TermsRepo termsRepo;

  TermsUseCase(this.termsRepo);
  Future<GetTermsEntity> call() {
    return termsRepo.loadData();
  }
}
