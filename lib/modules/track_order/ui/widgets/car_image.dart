import 'package:flutter/cupertino.dart';

import '../../../../core/constants/assets_paths.dart';

class CarImage extends StatelessWidget {
  const CarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsPaths.carIcon);
  }
}
