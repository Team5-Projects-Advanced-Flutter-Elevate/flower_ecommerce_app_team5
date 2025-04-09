import 'package:flower_ecommerce_app_team5/modules/occasion/data/data_sources_contracts/occasion_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/occasion/data/models/get_occasion.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_executor/api_executor.dart';
import '../../../../core/apis/api_result/api_result.dart';
import '../../domain/entities/get_occasion.dart';
import '../api/api_client/api_client.dart';

@Injectable(as:OccasionOnlineDataSource)
class OccasionOnlineDataSourceImpl implements OccasionOnlineDataSource {
  OccasionApiClient _occasionApiClient;
  OccasionOnlineDataSourceImpl(this._occasionApiClient);
  @override
  Future<List<Occasion>> getOccasion() async {
    var result = await ApiExecutor.executeApi(
        () async => await _occasionApiClient.getOccasionData());

    switch (result) {
      case Success<GetOccasionDTO>():
        return result.data.occasions?.map((e) => e.toEntity()).toList() ?? [];
      case Error<GetOccasionDTO>():
        throw Exception(result.error); // or handle it appropriately
    }
  }
}
