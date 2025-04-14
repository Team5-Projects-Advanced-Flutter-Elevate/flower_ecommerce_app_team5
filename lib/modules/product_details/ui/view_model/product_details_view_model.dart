import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsViewModel extends ChangeNotifier {
  ValueNotifier<int> activeIndexOfSmoothIndicator = ValueNotifier(0);
  void setActiveIndexOfSmoothIndicator(int index) {

    activeIndexOfSmoothIndicator.value = index;
  }
}
