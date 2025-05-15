import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/bases/base_inherited_widget.dart';
import '../../../../core/bases/base_statless_widget.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/assets_paths.dart';
import '../../../../core/constants/constants.dart';
import '../../../../shared_layers/localization/generated/locale_keys.g.dart';

class DriverInformation extends BaseStatelessWidget {
  const DriverInformation({super.key});

  // Add driver contact information
  final String driverPhoneNumber = '+201065618744'; // Example phone number
  final String driverName = 'mahmoud';

  // Function to make a phone call
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  // Function to open WhatsApp
  Future<void> _openWhatsApp(String phoneNumber) async {
    // Format the phone number by removing any non-digit characters
    String formattedNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

    // Create WhatsApp URL - note that WhatsApp expects phone numbers with country code but no '+'
    final Uri whatsappUri = Uri.parse('https://wa.me/$formattedNumber');

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $whatsappUri';
    }
  }

  @override
  Widget customBuild(BuildContext context, BaseInheritedWidget inherit) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
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
                  driverName,
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
                GestureDetector(
                  onTap: () => _makePhoneCall(driverPhoneNumber),
                  child: ImageIcon(
                    AssetImage(
                      AssetsPaths.callIcon,
                    ),
                    color: AppColors.mainColor,
                    size: 18,
                  ),
                ),
                SizedBox(
                  width: inherit.screenWidth * 0.05,
                ),
                GestureDetector(
                  onTap: () => _openWhatsApp(driverPhoneNumber),
                  child: Image.asset(
                    AssetsPaths.whatsAppIcon,
                    width: inherit.screenWidth * 0.06,
                    height: inherit.screenHeight * 0.06,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
