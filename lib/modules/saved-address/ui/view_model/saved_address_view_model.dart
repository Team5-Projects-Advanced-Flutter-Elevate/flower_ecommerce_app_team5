import 'package:flower_ecommerce_app_team5/modules/saved-address/ui/view_model/saved_address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_error/api_error_handler.dart';
import '../../../../core/apis/api_result/api_result.dart';
import '../../../../core/di/injectable_initializer.dart';
import '../../domain/entities/saved_address_entity.dart';
import '../../domain/use_cases/delete_address_use_case.dart';
import '../../domain/use_cases/get_saved_address_use_case.dart';

@injectable
class SavedAddressViewModel extends Cubit<SavedAddressState> {
  SavedAddressViewModel(
    this._getSavedAddressesUseCase,
    this._deleteAddressUseCase,
  ) : super(const SavedAddressState());

  final GetSavedAddressesUseCase _getSavedAddressesUseCase;
  final DeleteAddressUseCase _deleteAddressUseCase;

  void onIntent(SavedAddressIntent intent) {
    switch (intent) {
      case GetSavedAddressesIntent():
        _getSavedAddresses();
        break;
      case DeleteAddressIntent():
        _deleteAddress(addressId: intent.addressId);
        break;
    }
  }

  Future<void> _getSavedAddresses() async {
    emit(
      state.copyWith(loadAddressesState: SavedAddressesState.loading),
    );
    var result = await _getSavedAddressesUseCase.call();
    switch (result) {
      case Success<List<SavedAddressEntity>>():
        emit(
          state.copyWith(
            loadAddressesState: SavedAddressesState.success,
            addressesList: result.data,
          ),
        );
        emit(
          state.copyWith(loadAddressesState: SavedAddressesState.idle),
        );
        break;
      case Error<List<SavedAddressEntity>>():
        emit(
          state.copyWith(
            loadAddressesState: SavedAddressesState.error,
            loadAddressesErrMsg:
                getIt.get<ApiErrorHandler>().handle(result.error),
          ),
        );
        break;
    }
  }

  Future<void> _deleteAddress({
    required String addressId,
  }) async {
    emit(
      state.copyWith(
        deleteAddressState: SavedAddressesState.loading,
      ),
    );
    var result = await _deleteAddressUseCase.call(addressId);
    switch (result) {
      case Success<List<SavedAddressEntity>>():
        emit(
          state.copyWith(
            deleteAddressState: SavedAddressesState.success,
            addressesList: result.data,
          ),
        );
        // _getSavedAddresses(); // Refresh list after deletion
        break;
      case Error<List<SavedAddressEntity>>():
        emit(
          state.copyWith(
            deleteAddressState: SavedAddressesState.error,
            deleteAddressErrMsg:
                getIt.get<ApiErrorHandler>().handle(result.error),
          ),
        );
        break;
    }
  }
}

sealed class SavedAddressIntent {}

class GetSavedAddressesIntent extends SavedAddressIntent {}

class DeleteAddressIntent extends SavedAddressIntent {
  final String addressId;
  DeleteAddressIntent({required this.addressId});
}
