import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/about_us.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/terms.dart';
import 'package:flower_ecommerce_app_team5/core/constants/assets_paths.dart';
import 'package:flower_ecommerce_app_team5/core/constants/constants.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/view_model/profile_layout_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/view_model/profile_state.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/view_model/home_screen_view_model.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../core/di/injectable_initializer.dart';
import '../../../../../shared_layers/localization/enums/languages_enum.dart';
import '../../../../order_page/ui/order_page_screen.dart';

class ProfileLayout extends StatefulWidget {
  const ProfileLayout({super.key});

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends BaseStatefulWidgetState<ProfileLayout> {
  bool isNotificationOn = true;
  late ProfileViewModelCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        viewModel = getIt.get<ProfileViewModelCubit>();
        viewModel.processIntent(LoadProfile());
        return viewModel;
      },
      child: Scaffold(body: BlocBuilder<ProfileViewModelCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileDataSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image(
                          image: AssetImage(AssetsPaths.logo),
                          width: 89,
                          height: 25,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, DefinedRoutes.notificationScreen);
                            },
                            icon: Icon(
                              Icons.notifications_none_outlined,
                              size: 24,
                              color: AppColors.gray,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundImage: state.photo == Constants.guest
                            ? null
                            : CachedNetworkImageProvider(state.photo),
                        radius: 70,
                        child:
                            state.photo == '' || state.photo == Constants.guest
                                ? const Icon(
                                    Icons.person,
                                    size: 50,
                                  )
                                : null,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          state.name,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed<bool>(context,
                                      DefinedRoutes.editProfileScreenRoute)
                                  .then(
                                (value) {
                                  if (value == true) {
                                    viewModel.processIntent(LoadProfile());
                                  }
                                },
                              );
                            },
                            child: Icon(
                              Icons.edit,
                              color: AppColors.mainColor,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(state.email,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: AppColors.gray, fontSize: 18))
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => const MyOrderPageScreen(),));

                      },
                      child: ListTile(
                        title: Text(LocaleKeys.myOrders.tr()),
                        leading: const Icon(Icons.list),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          DefinedRoutes.addNewAddress,
                        );
                      },
                      child: ListTile(
                        title: Text(LocaleKeys.savedAddress.tr()),
                        leading: const Icon(Icons.location_on),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,DefinedRoutes.savedAddressScreenRoute);
                      },
                      child: ListTile(
                        title: Text(LocaleKeys.savedAddress.tr()),
                        leading: const Icon(Icons.location_on),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    Divider(
                      color: AppColors.gray,
                    ),
                    ListTile(
                      leading: Switch(
                        value: isNotificationOn,
                        onChanged: (value) {
                          setState(() {
                            isNotificationOn = value;
                          });
                        },
                        activeColor: AppColors.white,
                        activeTrackColor: AppColors.mainColor,
                        inactiveThumbColor: AppColors.white,
                        inactiveTrackColor: AppColors.gray,
                      ),
                      title: Text(LocaleKeys.notification.tr()),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                    Divider(
                      color: AppColors.gray,
                    ),
                    ListTile(
                      title: Text(LocaleKeys.language.tr()),
                      leading:
                          Image(image: AssetImage(AssetsPaths.languageIcon)),
                      trailing: GestureDetector(
                          onTap: () {
                            var newLocale = localizationManager.currentLocale ==
                                    LanguagesEnum.en.getLanguageCode()
                                ? LanguagesEnum.ar.getLanguageCode()
                                : LanguagesEnum.en.getLanguageCode();
                            localizationManager.changeLocal(newLocale);
                          },
                          child: Text(
                            LocaleKeys.languageKey.tr(),
                            style: TextStyle(color: AppColors.mainColor),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutUsScreen(),
                            ));
                      },
                      child: ListTile(
                        title: Text(LocaleKeys.aboutUs.tr()),
                        leading: const Icon(Icons.newspaper_outlined),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TermsScreen(),
                            ));
                      },
                      child: ListTile(
                        title: Text(LocaleKeys.termsConditions.tr()),
                        leading: const Icon(Icons.policy),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    Divider(
                      color: AppColors.gray,
                    ),
                    ListTile(
                      title: Text(LocaleKeys.logout.tr()),
                      leading: const Icon(Icons.logout),
                      trailing: GestureDetector(
                          onTap: () {
                            displayAlertDialog(
                              title: Column(
                                children: <Widget>[
                                  Text(
                                    LocaleKeys.logout.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                  Text(
                                    LocaleKeys.confirmLogout.tr(),
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  )
                                ],
                              ),
                              isDismissible: true,
                              showOkButton: true,
                              onOkButtonClick: () {
                                viewModel.clearSecureStorage();
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  DefinedRoutes.loginScreenRoute,
                                  (route) => false,
                                );
                                Provider.of<HomeScreenViewModel>(context,
                                        listen: false)
                                    .setAppSectionsIndex(0);
                              },
                            );
                          },
                          child: const Icon(Icons.logout)),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ProfileError) {
            return ErrorStateWidget(error: state.error);
          }
          return const SizedBox();
        },
      )),
    );
  }
}
