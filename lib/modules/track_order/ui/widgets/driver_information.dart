import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/bases/base_inherited_widget.dart';
import '../../../../core/bases/base_statless_widget.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/assets_paths.dart';
import '../../../../core/constants/constants.dart';
import '../../../../shared_layers/localization/generated/locale_keys.g.dart';

class DriverInformation extends BaseStatelessWidget {
  const DriverInformation({super.key});

  @override
  Widget customBuild(BuildContext context, BaseInheritedWidget inherit) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              AssetsPaths.deliveryBoyIcon,
            ),
          ),
          SizedBox(
            width: inherit.screenWidth * 0.04,
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'mahmoud',
                  style: inherit.theme.textTheme.labelLarge
                      ?.copyWith(color: AppColors.black),
                ),
                Text(
                  LocaleKeys.isYourDeliveryHeroForToday.tr(),
                  style: inherit.theme.textTheme.labelLarge?.copyWith(
                    fontSize:
                    10 * (inherit.screenWidth / Constants.designWidth),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                ImageIcon(
                  AssetImage(
                    AssetsPaths.callIcon,
                  ),
                  color: AppColors.mainColor,
                ),
                SizedBox(
                  width: inherit.screenWidth * 0.05,
                ),
                Image.asset(
                  AssetsPaths.whatsAppIcon,
                  width: inherit.screenWidth * 0.08,
                  height: inherit.screenHeight * 0.08,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
