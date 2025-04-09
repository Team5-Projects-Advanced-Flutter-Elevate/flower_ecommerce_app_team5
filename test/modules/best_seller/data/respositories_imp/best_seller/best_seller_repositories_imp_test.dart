import 'package:flower_ecommerce_app_team5/modules/best_seller/data/data_sources_contract/best_seller/best_seller_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/data/respositories_imp/best_seller/best_seller_repositories_imp.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/repositories_contracts/best_seller/best_seller_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'best_seller_repositories_imp_test.mocks.dart';

@GenerateMocks([BestSellerRemoteDataSource])
void main() {
  group(
    "BestSellerRepositoryImp class Testing",
    () {
      late BestSellerRepository bestSellerRepository;
      late BestSellerRemoteDataSource bestSellerRemoteDataSource;
      setUpAll(
        () {
          bestSellerRemoteDataSource = MockBestSellerRemoteDataSource();
          bestSellerRepository =
              BestSellerRepositoryImp(bestSellerRemoteDataSource);
        },
      );
      test(
        'When calling getBestSellerProducts(), it should call getBestSellerProducts() of remoteDataSource and return success<BestSellerResponseEntity> if the remoteDataSourceFunction returns success too.',
        () {},
      );
    },
  );
}
