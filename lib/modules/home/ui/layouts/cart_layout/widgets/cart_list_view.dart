import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/widgets/cart_item.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../core/bases/base_statless_widget.dart';

class CartListView extends BaseStatelessWidget {
  CartListView({super.key});

  @override
  Widget customBuild(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => CartItem(),
      itemCount: 10,
      separatorBuilder: (context, index) => SizedBox(
        height: screenHeight * 0.025,
      ),
    );
  }
}
