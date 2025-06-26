import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/categories_layout/view_model/categories_layout_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/occasion/ui/occasion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeScreenViewModel extends ChangeNotifier {
  int _selectedAppSectionIndex = 0;
  final PageController pageController = PageController(initialPage: 0);

  CategoriesLayoutViewModel categoriesLayoutViewModel;
  OccasionViewModelCubit occasionViewModelCubit;
  HomeScreenViewModel(
      this.categoriesLayoutViewModel, this.occasionViewModelCubit);

  int get selectedAppSectionIndex => _selectedAppSectionIndex;

  void doIntent(HomeScreenIntent intent) {
    switch (intent) {
      case JumpToPage():
        _jumpToPage(intent.pageIndex);
        break;
    }
  }

  void _jumpToPage(int pageIndex) {
    pageController.jumpToPage(
      pageIndex,
    );
  }

  void setAppSectionsIndex(int newIndex) {
    _selectedAppSectionIndex = newIndex;
    notifyListeners();
  }
}

sealed class HomeScreenIntent {}

class JumpToPage extends HomeScreenIntent {
  int pageIndex;

  JumpToPage({required this.pageIndex});
}
