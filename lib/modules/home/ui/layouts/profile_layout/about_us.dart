import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/view_model/profile_layout_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/view_model/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/bases/base_stateful_widget_state.dart';
import '../../../../../core/di/injectable_initializer.dart';
import '../../../../../core/widgets/error_state_widget.dart';
import '../../../../../shared_layers/localization/generated/locale_keys.g.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends BaseStatefulWidgetState<AboutUsScreen> {
  ProfileViewModelCubit viewModel = getIt.get<ProfileViewModelCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..processIntent(AboutUs()),
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            leadingWidth: screenWidth * 0.08,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  size: 20, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocaleKeys.aboutUs.tr(),
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 2),
              ],
            ),
          ),


          body: BlocBuilder<ProfileViewModelCubit, ProfileState>(
        builder: (context, state) {
          if (state is AboutUsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AboutUsSuccess) {
            return ListView.builder(
              itemCount: state.data.aboutApp.length,
              itemBuilder: (context, index) {
                final item = state.data.aboutApp[index];
                return ListTile(
                  title: Text(
                    (item.content?.en).toString(),
                    style: TextStyle(
                      fontSize: (item.style?.fontSize)?.toDouble(),
                      fontWeight: _parseFontWeight(item.style?.fontWeight),
                      color: _parseColor(item.style?.color),
                      backgroundColor: _parseColor(item.style?.backgroundColor),
                    ),
                    textAlign: _parseTextAlign(item.style?.textAlign?.en),
                  ),
                );
              },
            );
          } else if (state is AboutUsError) {
            debugPrint('err${state.error}');
            return ErrorStateWidget(error: state.error);
          }
          return const SizedBox();
        },
      )),
    );
  }
}

Color? _parseColor(String? hexColor) {
  if (hexColor == null || hexColor.isEmpty) return null;
  final buffer = StringBuffer();
  if (hexColor.length == 6 || hexColor.length == 7) buffer.write('ff');
  buffer.write(hexColor.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

TextAlign? _parseTextAlign(String? align) {
  switch (align?.toLowerCase()) {
    case 'center':
      return TextAlign.center;
    case 'left':
      return TextAlign.left;
    case 'right':
      return TextAlign.right;
    case 'justify':
      return TextAlign.justify;
    default:
      return null;
  }
}

FontWeight? _parseFontWeight(String? weight) {
  switch (weight?.toLowerCase()) {
    case 'bold':
      return FontWeight.bold;
    case 'w500':
      return FontWeight.w500;
    case 'w400':
      return FontWeight.w400;
    case 'normal':
      return FontWeight.normal;
    // أضف اللي تحتاجه
    default:
      return null;
  }
}
