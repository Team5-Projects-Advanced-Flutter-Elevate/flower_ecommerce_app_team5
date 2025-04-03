import 'package:bloc_test/bloc_test.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/home_data_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/get_home_data_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/home_layout/view_model/home_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_cubit_test.mocks.dart';

@GenerateMocks([GetHomeDataUseCase])
void main() {
  late GetHomeDataUseCase getHomeDataUseCase;
  late HomeCubit homeCubit;
  late HomeDataResponseEntity homeDataResponseEntity;
  group('home cubit', () {
    setUp(() {
      getHomeDataUseCase = MockGetHomeDataUseCase();
      homeCubit = HomeCubit(getHomeDataUseCase);
      homeDataResponseEntity = HomeDataResponseEntity();
    });
    group('get home data', () {
      blocTest(
        'get home data success',
        build: () => homeCubit,
        setUp: () {
          provideDummy<ApiResult<HomeDataResponseEntity>>(
            Success<HomeDataResponseEntity>(
              data: homeDataResponseEntity,
            ),
          );
          when(getHomeDataUseCase.execute()).thenAnswer(
            (_) async => Success<HomeDataResponseEntity>(
              data: homeDataResponseEntity,
            ),
          );
        },
        act: (cubit) => cubit.doIntent(GetHomeDataIntent()),
        expect: () => [
          const HomeState(
            state: HomeStatus.loading,
          ),
          HomeState(
            state: HomeStatus.success,
            homeDataResponseEntity: homeDataResponseEntity,
          ),
        ],
      );
      blocTest('get home data error',
          build: () => homeCubit,
          setUp: () {
            provideDummy<ApiResult<HomeDataResponseEntity>>(
              Error<HomeDataResponseEntity>(
                error: 'error',
              ),
            );
            when(getHomeDataUseCase.execute()).thenAnswer(
              (_) async => Error<HomeDataResponseEntity>(
                error: 'error',
              ),
            );
          },
          act: (cubit) => cubit.doIntent(GetHomeDataIntent()),
          expect: () => [
                const HomeState(
                  state: HomeStatus.loading,
                ),
                const HomeState(
                  state: HomeStatus.error,
                  error: 'error',
                ),
              ]);
    });
  });
}
