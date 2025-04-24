import 'package:flower_ecommerce_app_team5/modules/home/domain/repo_contract/home_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/apis/api_result/api_result.dart';
import '../entities/occasion_entity.dart';

@injectable
class GetOccasionsUseCase {
  final HomeRepo _homeRepo;

  GetOccasionsUseCase(this._homeRepo);

  Future<ApiResult<List<OccasionEntity>?>> execute() =>
      _homeRepo.getAllOccasions();
}
