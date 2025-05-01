import '../../domain/entity/order_page_entity.dart';

sealed class GetMyOrdersState {}

class GetMyOrdersLoading extends GetMyOrdersState {}

class GetMyOrdersInitial extends GetMyOrdersState {}

class GetMyOrdersSuccess extends GetMyOrdersState {
  final List<GetMyOrdersEntity> orders;

  GetMyOrdersSuccess(this.orders);
}

class GetMyOrdersError extends GetMyOrdersState {
  final String errorMessage;

  GetMyOrdersError(this.errorMessage);
}
