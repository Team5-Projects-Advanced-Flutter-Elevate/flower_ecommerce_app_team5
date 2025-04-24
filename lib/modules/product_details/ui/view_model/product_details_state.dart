import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ColorPalettesStatus {
  idle,
  loading,
  loaded,
}

class ProductDetailsState extends Equatable {
  final ColorPalettesStatus colorPalettesStatus;
  final List<Color> imagesMainColor;
  const ProductDetailsState(
      {this.colorPalettesStatus = ColorPalettesStatus.idle,
      this.imagesMainColor = const []});
  @override
  List<Object?> get props => [colorPalettesStatus, imagesMainColor];
}
