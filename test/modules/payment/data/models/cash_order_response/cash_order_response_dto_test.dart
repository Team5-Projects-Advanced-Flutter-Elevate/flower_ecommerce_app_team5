import 'package:flower_ecommerce_app_team5/modules/home/data/models/product_do/product_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/models/cash_order_response/cash_order_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    "Testing convertIntoEntity() functions related to CashOrderResponseDot",
    () {
      OrderItemDto dummyOrderItem = const OrderItemDto(
        id: 'order_item_123',
        product: null,
        price: 19.99,
        quantity: 2,
      );
      OrderDto dummyOrderDto = OrderDto(
        id: 'ord_123456789',
        user: 'user_987654321',
        orderItems: [
          OrderItemDto(
            id: 'item_1',
            product: ProductDto(id: 'prod_123', title: 'T-Shirt', price: 19.99),
            price: 19.99,
            quantity: 2,
          ),
          OrderItemDto(
            id: 'item_2',
            product:
                ProductDto(id: 'prod_456', title: 'Coffee Mug', price: 12.50),
            price: 12.50,
            quantity: 1,
          ),
        ],
        totalPrice: 52.48, // (19.99 * 2) + 12.50
        paymentType: 'credit_card',
        isPaid: true,
        isDelivered: false,
        state: 'processing',
        createdAt: '2023-10-01T10:30:00Z',
        updatedAt: '2023-10-01T11:15:00Z',
        orderNumber: 'ORD-2023-12345',
        v: 1, // Version field (common in MongoDB)
      );
      CashOrderResponseDto cashOrderResponseDto =
          CashOrderResponseDto(message: "success", order: dummyOrderDto);
      test(
        "When calling convertIntoEntity() of OrderItemDto, it should return the right entity",
        () {
          // act
          var result = dummyOrderItem.convertIntoEntity();
          // assert
          expect(result.id, dummyOrderItem.id);
          expect(result.price, dummyOrderItem.price);
          expect(result.product, dummyOrderItem.product);
          expect(result.quantity, dummyOrderItem.quantity);
        },
      );
      test(
        "When calling convertIntoEntity() of OrderDto, it should return the right entity",
        () {
          // act
          var result = dummyOrderDto.convertIntoEntity();
          // assert
          expect(result.id, dummyOrderDto.id);
          expect(result.orderNumber, dummyOrderDto.orderNumber);
          expect(result.user, dummyOrderDto.user);
          expect(result.totalPrice, dummyOrderDto.totalPrice);
          expect(result.paymentType, dummyOrderDto.paymentType);
          expect(result.isPaid, dummyOrderDto.isPaid);
          expect(result.isDelivered, dummyOrderDto.isDelivered);
          expect(result.state, dummyOrderDto.state);
          expect(result.orderNumber, dummyOrderDto.orderNumber);
          expect(result.v, dummyOrderDto.v);
        },
      );
      test(
        "When calling convertIntoEntity() of CashOrderResponseDto, it should return the right entity",
        () {
          // act
          var result = cashOrderResponseDto.convertIntoEntity();
          // assert
          expect(result.message, cashOrderResponseDto.message);
          expect(result.order, cashOrderResponseDto.order?.convertIntoEntity());
        },
      );
    },
  );
}
