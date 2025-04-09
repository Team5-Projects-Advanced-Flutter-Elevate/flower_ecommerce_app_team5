import 'package:flower_ecommerce_app_team5/core/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bases/base_stateful_widget_state.dart';
import '../../../core/di/injectable_initializer.dart';
import 'occasion_cubit.dart';
import 'occasion_state.dart';

class OcassionListScreen extends StatefulWidget {
  const OcassionListScreen({super.key});

  @override
  State<OcassionListScreen> createState() => _OcassionListScreenState();
}

class _OcassionListScreenState
    extends BaseStatefulWidgetState<OcassionListScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late OcassionViewModelCubit viewModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        viewModel = getIt.get<OcassionViewModelCubit>();
        viewModel.processIntent(LoadOccasionIntent());
        return viewModel;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                  Text('Occasion',
                      style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),
            ],
          )
        ),
        body: BlocBuilder<OcassionViewModelCubit, OccasionState>(
          builder: (context, state) {
            if (state is OccasionLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is OccasionSuccess) {
              final allOccasions = state.allOccasions;
              final filtered = state.filteredOccasions;
              final slugs = allOccasions.map((e) => e.slug).toSet().toList();
              final selectedSlug = state.selectedSlug;

              final selectedIndex = slugs.indexOf(selectedSlug);

              return DefaultTabController(
                length: slugs.length,
                initialIndex: selectedIndex, // <- important!
                child: Column(
                  children: [
                    TabBar(

                      isScrollable: true,
                      labelColor: Colors.pink,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.pink,
                      onTap: (index) {
                        final slug = slugs[index];
                        viewModel.processIntent(LoadFilterIntent(slug));
                      },
                      tabs: slugs.map((slug) => Tab(text: slug)).toList(),
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: filtered.length,
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenHeight * 0.01),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 163 / 229,
                                mainAxisSpacing: 17,
                                crossAxisSpacing: 17),
                        itemBuilder: (context, index) {
                          final occasion = filtered[index];
                          return ProductCard(
                              onProductCardClick: () {},
                              onAddToCartButtonClick: () {},
                              width: screenWidth * 0.45,
                              height: screenHeight * 0.25,
                              productTitle: occasion.name,
                              price: 600 + index + 20,
                              // priceAfterDiscountIfExist: 1899,
                              imageUrl:
                                  "https://flower.elevateegy.com/uploads/${occasion.image}");
                        },
                      ),
                    )
                  ],
                ),
              );
            } else if (state is OccasionError) {
              return Center(child: Text("Error: ${state.message}"));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
