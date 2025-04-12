part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  error,
}

class HomeState extends Equatable {
  final HomeStatus state;
  final Object? error;
  final HomeDataResponseEntity? homeDataResponseEntity;

  const HomeState({
    this.state = HomeStatus.initial,
    this.error,
    this.homeDataResponseEntity,
  });

  HomeState copyWith({
    HomeStatus? state,
    Object? error,
    HomeDataResponseEntity? homeDataResponseEntity,
  }) {
    return HomeState(
        state: state ?? this.state,
        error: error ?? this.error,
        homeDataResponseEntity:
            homeDataResponseEntity ?? this.homeDataResponseEntity);
  }

  @override
  List<Object?> get props => [
        state,
        error,
        homeDataResponseEntity,
      ];
}
