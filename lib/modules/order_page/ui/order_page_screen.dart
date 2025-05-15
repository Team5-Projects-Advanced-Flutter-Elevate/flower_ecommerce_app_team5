import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/bases/base_stateful_widget_state.dart';
import '../../../core/di/injectable_initializer.dart';
import '../../../shared_layers/localization/generated/locale_keys.g.dart';
import 'cubit/order_page_view_model.dart';
import 'cubit/state.dart';
import 'order_card.dart';

class MyOrderPageScreen extends StatefulWidget {
  const MyOrderPageScreen({super.key});

  @override
  State<MyOrderPageScreen> createState() => _MyOrderPageScreenState();
}

class _MyOrderPageScreenState
    extends BaseStatefulWidgetState<MyOrderPageScreen> {
  late MyOrdersViewModelCubit viewModel = getIt.get<MyOrdersViewModelCubit>();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    viewModel.processIntent(LoadOrderPageIntent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          leadingWidth: screenWidth * 0.08,
          leading: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.myOrders.tr(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        body: BlocBuilder<MyOrdersViewModelCubit, GetMyOrdersState>(
          builder: (context, state) {
            if (state is GetMyOrdersLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetMyOrdersSuccess) {
              final allOrders = state.orders.orderEntities;

              final activeOrders = allOrders
                  .where((order) =>
                      order.isDelivered == false &&
                      (order.orderItems?.isNotEmpty ?? false))
                  .toList();
              final completeOrders = allOrders
                  .where((order) =>
                      order.isDelivered == true &&
                      (order.orderItems?.isNotEmpty ?? false))
                  .toList();
              print(activeOrders[0].totalPrice);

              return DefaultTabController(
                length: 2,
                initialIndex: selectedIndex == -1 ? 0 : selectedIndex,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: TabBar(
                        physics: const BouncingScrollPhysics(),
                        isScrollable: false,
                        labelPadding: EdgeInsets.zero,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabAlignment: TabAlignment.fill,
                        indicatorWeight: 2,
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        tabs: [
                          Tab(text: LocaleKeys.active.tr()),
                          Tab(text: LocaleKeys.complete.tr()),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          // Active Orders Tab
                          activeOrders.isEmpty
                              ? Center(child: Text(LocaleKeys.noOrder.tr()))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: activeOrders.length,
                                  itemBuilder: (context, index) {
                                    final order = activeOrders[index];

                                    return OrderCard(
                                      orderEntity: order,
                                    );
                                  },
                                ),

                          // Complete Orders Tab
                          completeOrders.isEmpty
                              ? Center(child: Text(LocaleKeys.noOrder.tr()))
                              : ListView.builder(
                                  itemCount: completeOrders.length,
                                  itemBuilder: (context, index) {
                                    final order = completeOrders[index];

                                    return OrderCard(
                                      orderEntity: order,
                                    );
                                  },
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is GetMyOrdersError) {
              return ErrorStateWidget(error: state.errorMessage);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
