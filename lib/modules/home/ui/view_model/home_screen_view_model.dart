import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/categories_layout/view_model/categories_layout_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/occasion/ui/occasion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeScreenViewModel extends ChangeNotifier {
  int selectedAppSectionIndex = 0;
  final PageController pageController = PageController(initialPage: 0);

  CategoriesLayoutViewModel categoriesLayoutViewModel;
  OccasionViewModelCubit occasionViewModelCubit;
  HomeScreenViewModel(
      this.categoriesLayoutViewModel, this.occasionViewModelCubit);

  void doIntent(HomeScreenIntent intent) {
    switch (intent) {
      case AnimateToPage():
        _animateToPage(intent.pageIndex);
        break;
    }
  }

  void _animateToPage(int pageIndex) {
    pageController.animateToPage(pageIndex,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}

sealed class HomeScreenIntent {}

class AnimateToPage extends HomeScreenIntent {
  int pageIndex;

  AnimateToPage({required this.pageIndex});
}
