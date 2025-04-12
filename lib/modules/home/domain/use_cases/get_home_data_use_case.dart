import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../entities/home_data_response_entity.dart';
import '../repo_contract/home_repo.dart';

@injectable
class GetHomeDataUseCase {
  final HomeRepo homeRepo;

  GetHomeDataUseCase(this.homeRepo);

  Future<ApiResult<HomeDataResponseEntity>> execute() => homeRepo.getHomeData();
}
