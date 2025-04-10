import 'package:flower_ecommerce_app_team5/modules/home/domain/repo_contract/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../entities/category_entity.dart';

@injectable
class GetCategoriesUseCase {
  final HomeRepo _homeRepo;

  GetCategoriesUseCase(this._homeRepo);

  Future<ApiResult<List<CategoryEntity>?>> execute() =>
      _homeRepo.getAllCategories();
}
