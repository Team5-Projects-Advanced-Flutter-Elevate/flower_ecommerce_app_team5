import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/saved_address/domain/entities/saved_address/saved_address_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/saved_address/domain/use_cases/saved_address/get_saved_address_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/saved_address/ui/view_model/saved_address_intent.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/saved_address/ui/view_model/saved_address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/saved_address_response/saved_address_response_dto.dart';

@injectable
class SavedAddressViewModel extends Cubit<SavedAddressState> {
  GetSavedAddressUseCase savedAddressUseCase;

  SavedAddressViewModel(this.savedAddressUseCase)
      : super(const SavedAddressState());

  Future<void> doIntent(SavedAddressIntent intent) {
    switch (intent) {
      case GetSavedAddress():
        return _getSavedAddressUseCase();
    }
  }

  Future<void> _getSavedAddressUseCase() async {
    emit(const SavedAddressState(savedAddressStatus: SavedAddressStatus.loading));
    var useCaseResult = await savedAddressUseCase();
    switch (useCaseResult) {
      case Success<SavedAddressResponseEntity>():
        emit(SavedAddressState(savedAddressStatus: SavedAddressStatus.success,savedAddress: useCaseResult.data));
      case Error<SavedAddressResponseEntity>():
        emit(SavedAddressState(savedAddressStatus: SavedAddressStatus.error, error: useCaseResult.error));
    }
  }
}

