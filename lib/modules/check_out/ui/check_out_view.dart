import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends BaseStatefulWidgetState<CheckOutView> {
  String address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white[60],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: const Text(
          "Checkout",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.48,
              color: AppColors.white,
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'Delivery address',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontSize: 14 * (screenWidth / 375),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => const AddressItem(),
                      itemCount: 10,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                        ),
                        Text(
                          'Add new ',
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              height: screenHeight * 0.4,
              color: AppColors.white,
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      'Payment Method',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontSize: 14 * (screenWidth / 375),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const PaymentItem(title: 'Cash on delivery'),
                  const PaymentItem(title: 'Credit card'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentItem extends StatefulWidget {
  const PaymentItem({super.key, required this.title});

  final String title;

  @override
  State<PaymentItem> createState() => _PaymentItemState();
}

class _PaymentItemState extends BaseStatefulWidgetState<PaymentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.white[90]!.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: GoogleFonts.inter(
                  textStyle: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 12 * (screenWidth / 375),
                  ),
                ),
              ),
              const Spacer(),
              Radio(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: '',
                groupValue: '',
                onChanged: (val) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddressItem extends StatefulWidget {
  const AddressItem({super.key});

  @override
  State<AddressItem> createState() => _AddressItemState();
}

class _AddressItemState extends BaseStatefulWidgetState<AddressItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.12,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.white[90]!.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio<String>(
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: 'Home',
                    groupValue: 'Home',
                    onChanged: (val) {
                      setState(() {});
                    },
                  ),
                  Text(
                    'Home',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontSize: 12 * (screenWidth / 375),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: Text('sheikh zayed',
                    style: GoogleFonts.roboto(
                      textStyle: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 10 * (screenWidth / 375),
                        color: AppColors.gray,
                      ),
                    )),
              )
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.edit_outlined,
          ),
        ],
      ),
    );
  }
}
