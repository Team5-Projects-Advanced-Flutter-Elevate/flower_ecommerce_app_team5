import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/view_model/profile_layout_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/view_model/profile_state.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injectable_initializer.dart';
import '../../../../../shared_layers/localization/enums/languages_enum.dart';

class ProfileLayout extends StatefulWidget {
  const ProfileLayout({super.key});

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends BaseStatefulWidgetState<ProfileLayout> {
  bool isNotificationOn = true;
  LanguagesEnum _currentLanguage = LanguagesEnum.en;
  late ProfileViewModelCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        viewModel = getIt.get<ProfileViewModelCubit>();
        viewModel.processIntent(LoadProfile());
        return viewModel;
      },
      child: Scaffold(
          body: BlocBuilder<ProfileViewModelCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProfileDataSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    physics:const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Image(
                              image: AssetImage('assets/icons/Logo.png'),
                              width: 89,
                              height: 25,
                            ),
                            Icon(
                              Icons.notifications_none_outlined,
                              size: 24,
                              color: AppColors.gray,
                            )
                          ],
                        ),
                        SizedBox(height: screenHeight*0.01,),
                        Center(
                          child: CircleAvatar(
                            backgroundImage: state.photo == 'Guest'
                                ? const AssetImage('assets/icons/profile_icon.png')
                                : CachedNetworkImageProvider(state.photo),
                            radius: 70,
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
                                onTap: () {},
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
                                    ?.copyWith(
                                        color: AppColors.gray, fontSize: 18))
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ListTile(
                          title: Text(LocaleKeys.myOrders.tr()),
                          leading: const Icon(Icons.list),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          title: Text(LocaleKeys.savedAddress.tr()),
                          leading: const Icon(Icons.location_on),
                          trailing: const Icon(Icons.arrow_forward_ios),
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
                          leading: const Image(
                              image: AssetImage('assets/icons/LanguageIcon.png')),
                          trailing: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_currentLanguage == LanguagesEnum.en) {
                                    _currentLanguage = LanguagesEnum.ar;
                                  } else {
                                    _currentLanguage = LanguagesEnum.en;
                                  }
                                });

                                context.setLocale(
                                    Locale(_currentLanguage.getLanguageCode()));
                              },
                              child: Text(
                                LocaleKeys.languageKey.tr(),
                                style: TextStyle(color: AppColors.mainColor),
                              )),
                        ),
                        ListTile(
                          title: Text(LocaleKeys.aboutUs.tr()),
                          leading: const Icon(Icons.newspaper_outlined),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          title: Text(LocaleKeys.termsConditions.tr()),
                          leading: const Icon(Icons.policy),
                          trailing: const Icon(Icons.arrow_forward_ios),
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
                                    spacing: 10,
                                    children: <Widget>[
                                      Text(
                                        LocaleKeys.logout.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                      Text(
                                        LocaleKeys.confirmLogout.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      )
                                    ],
                                  ),
                                  isDismissible: true,
                                  showOkButton: true,
                                  onOkButtonClick: () {
                                    viewModel.clearSecureStorage(this.context);
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
                return Center(child: Text("Error: ${state.error}"));
              }
              return const SizedBox();
            },
          )),
    );
  }
}
