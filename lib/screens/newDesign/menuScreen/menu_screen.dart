import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/models/cartItems.dart';
import 'package:my_flutter/routes/routes.dart';
import 'package:my_flutter/screens/mobile/allTable/alltable_view_model.dart';
import 'package:my_flutter/screens/mobile/orders/viewmodel/table_order_viewmodel.dart';
import 'package:my_flutter/screens/newDesign/components/add_item_new_dialog.dart';
import 'package:my_flutter/screens/newDesign/menuScreen/category_card.dart';
import 'package:my_flutter/screens/newDesign/menuScreen/menu_item.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/dummyJson.dart';
import '../../../utils/responsive.dart';

class MenuScreen extends StatefulWidget {
  final Function selectedMenu;
  const MenuScreen(this.selectedMenu, {super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int? selectedCategoryval;
  int? selectedIndex;

  TableOrderViewModel viewModel = Get.put(TableOrderViewModel());
  selectedMenu(Orders order, int count, int type) {
    if (kDebugMode) {
      print("$order $count $type");
    }
    viewModel.add(order, count, type == 1 ? "Half" : "Full");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<AllTableViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    print("Menu Screen");
    return Responsive(
        mobile: getWidget(1), tablet: getWidget(2), desktop: getWidget(3));
  }

  Widget getWidget(type) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          leading: IconButton(
            onPressed: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Get.toNamed(RouteClass.table, id: 1)
                    ?.then((value) => Get.delete<AllTableViewModel>());
              });
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getGridViewCount(type),
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 2.0,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  itemCount: DummyJson.dummyCategory.data?.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      index,
                      selectedCategory: selectedCategoryval,
                      data: DummyJson.dummyCategory.data?[index],
                      onPressed: (value, selected) {
                        selectedIndex = selected;
                        selectedCategoryfun(value);
                      },
                    );
                  }),
            ),
            const Divider(),
            if (selectedIndex != null)
              Expanded(
                flex: 2,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getGridViewCount(type),
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 2.0,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    itemCount: DummyJson
                        .dummyCategory.data?[selectedIndex!].menu?.length,
                    itemBuilder: (context, index) {
                      return CategoryMenuItem(
                          data: DummyJson
                              .dummyCategory.data![selectedIndex!].menu?[index],
                          onPressed: (val) {
                            ShowAddItemDialog(val);
                          });
                    }),
              ),
          ],
        ));
  }

  getGridViewCount(type) {
    if (type == 1) {
      return 2;
    } else if (type == 2) {
      return 4;
    } else {
      return 6;
    }
  }

  void ShowAddItemDialog(Orders? value) {
    showDialog(
        context: context,
        builder: (builder) {
          return AddItemNewDialog(value, selectedMenu);
        });
  }

  void selectedCategoryfun(int? id) {
    setState(() {
      selectedCategoryval = id;
    });
  }
}
