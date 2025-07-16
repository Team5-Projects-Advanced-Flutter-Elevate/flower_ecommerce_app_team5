import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/colors/app_colors.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utilities/extensions/sort_ex.dart';
import '../../../../../../shared_layers/localization/generated/locale_keys.g.dart';
import '../view_model/categories_layout_view_model.dart';

showSortBottomSheet(
    {required CategoriesLayoutViewModel viewModel,
    required BuildContext context,
    required theme,
    required num screenWidth,
    required num screenHeight}) {
  String? selectedSortValue;
  List<String> sortListTitles;
  final sortListValues = Sort.values.map((e) => e.value).toList();
  if (LocaleKeys.filter.tr() == "filter") {
    sortListTitles = Sort.values.map((e) => e.title).toList();
  } else {
    sortListTitles = Sort.values.map((e) => e.titleA).toList();
  }
  showModalBottomSheet(
    //  backgroundColor: color.,
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        // Add this wrapper
        builder: (BuildContext context, StateSetter setModalState) {
          return SizedBox(
            height: screenHeight * 0.7,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: .2 * screenWidth,
                              child: LinearProgressIndicator(
                                value: 1,
                                color: AppColors.black[50],
                              ))
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 24, top: 16),
                    child: Text(
                      LocaleKeys.sort.tr(),
                      style: GoogleFonts.outfit(
                          textStyle: theme.textTheme.headlineMedium!
                              .copyWith(color: AppColors.mainColor)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        right: 16,
                        left: 16,
                      ),
                      child: ListView.separated(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        itemCount: sortListValues.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: .5,
                                    blurStyle: BlurStyle.outer,
                                    color: AppColors.white[70]!, // Shadow color
                                    blurRadius: 4.0, // Spread of the shadow
                                    offset: const Offset(
                                        0, 0), // Shadow position (x,y)
                                  ),
                                  BoxShadow(
                                    color: AppColors.white[70]!, // Shadow color
                                    blurRadius: 8.0, // Spread of the shadow
                                    offset: const Offset(
                                      4,
                                      4,
                                    ), // Shadow position (x,y)
                                  ),
                                ],
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: AppColors.white[50]!, width: 3)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(sortListTitles[index],
                                      style: GoogleFonts.outfit(
                                          textStyle: theme.textTheme.labelLarge!
                                              .copyWith(
                                                  color: AppColors.black))),
                                ),
                                Radio<String>(
                                  value: sortListValues[index],
                                  groupValue: selectedSortValue,
                                  onChanged: (value) {
                                    setModalState(() {
                                      // Use setModalState here
                                      selectedSortValue = value;
                                    });
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: viewModel.state.products.isEmpty ||
                                    selectedSortValue == null
                                ? null
                                : () {
                                    viewModel.processIntent(GetProductsIntent(
                                      categoryId: viewModel.selectedCategoryId,
                                      sortKey: selectedSortValue,
                                    ));
                                    selectedSortValue = null;
                                    Navigator.pop(context);
                                  },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.tune_outlined,
                                  size: 18 *
                                      (screenWidth / Constants.designWidth),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.02,
                                ),
                                Text(
                                  LocaleKeys.filter.tr(),
                                  style: theme.textTheme.labelLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13 *
                                          (screenWidth / Constants.designWidth),
                                      color: AppColors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
