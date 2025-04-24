import 'package:flower_ecommerce_app_team5/modules/home/data/datasource_contract/terms.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/terms.dart';
import '../../domain/repo_contract/terms.dart';

@Injectable(as: TermsRepo)
class TermsRepoImpl implements TermsRepo {
  TermsLocalDataSource termsLocalDataSource;
  TermsRepoImpl(this.termsLocalDataSource);
  @override
  Future<GetTermsEntity> loadData() {
    // TODO: implement loadData
    return termsLocalDataSource.loadData();
  }
}
