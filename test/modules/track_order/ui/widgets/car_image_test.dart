import 'package:flower_ecommerce_app_team5/core/constants/assets_paths.dart';
import 'package:flower_ecommerce_app_team5/modules/track_order/ui/widgets/car_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CarImage', () {
    testWidgets('car image displays correct asset image',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CarImage(),
        ),
      );

      final imageFinder = find.byType(Image);

      expect(imageFinder, findsOneWidget);

      final image = tester.widget<Image>(imageFinder);
      expect(image.image, AssetImage(AssetsPaths.carIcon));
    });

    testWidgets('car image renders with out errors ',
        (WidgetTester tester) async {

      await tester.pumpWidget(
        const MaterialApp(
          home: CarImage(),
        ),
      );

      expect(find.byType(CarImage), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
