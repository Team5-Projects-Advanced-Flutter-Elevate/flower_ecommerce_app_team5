import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/home_data_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/get_home_data_use_case.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.getHomeDataUseCase) : super(const HomeState());
  final GetHomeDataUseCase getHomeDataUseCase;

  void doIntent(HomeIntent intent) {
    switch (intent) {
      case GetHomeDataIntent():
        _getHomeData();
    }
  }

  void _getHomeData() async {
    emit(state.copyWith(
      state: HomeStatus.loading,
    ));
    var result = await getHomeDataUseCase.execute();
    switch (result) {
      case Success<HomeDataResponseEntity>():
        emit(state.copyWith(
          state: HomeStatus.success,
          homeDataResponseEntity: result.data,
        ));
      case Error<HomeDataResponseEntity>():
        emit(
          state.copyWith(
            state: HomeStatus.error,
            error: result.error,
          ),
        );
    }
  }
}

sealed class HomeIntent {}

class GetHomeDataIntent extends HomeIntent {}
