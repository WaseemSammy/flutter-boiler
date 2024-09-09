import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_flutter/routes/routes.dart';
import 'package:my_flutter/screens/mobile/orders/ui/order_screen.dart';
import 'package:my_flutter/screens/newDesign/Table/table_card.dart';

import '../../../api/Status.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/color_constants.dart';
import '../../../models/all_table_response.dart';
import '../../../utils/responsive.dart';
import '../../mobile/allTable/alltable_view_model.dart';
import '../../mobile/common/common_app_bar.dart';
import '../components/customerDetailPopup.dart';
import '../components/paymentDetail.dart';
import '../sizeConfig.dart';

class TableScreen extends StatefulWidget {
  final VoidCallback onPressed;
  const TableScreen({super.key,required this.onPressed});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final double runSpacing = 3;
  final double spacing = 4;
  final int listSize = 5;
  final columns = 4;

  var selectedIndex = 0;

  final AllTableViewModel _viewModel = Get.put(AllTableViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Ensure this only runs once and avoids infinite build calls
      _viewModel.getAllTableData(context, 1);
    });

    //  getAreas();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: getWidget(1), tablet: getWidget(2), desktop: getWidget(3));
  }

  Widget getWidget(type) {
    final w =
        (MediaQuery.of(context).size.width - runSpacing * (columns - 30)) /
            columns;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: GetBuilder<AllTableViewModel>(
            init: AllTableViewModel(),
            builder: (viewModel) {
              switch (viewModel.allTableResponse.status) {
                case Status.LOADING:
                  return Container();

                case Status.COMPLETED:
                  AllTableResponse response =
                      viewModel.allTableResponse.data as AllTableResponse;
                  return GridView.builder(
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getGridViewCount(type),
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 2.0,
                    ),
                    padding: EdgeInsets.all(8.0),
                    itemCount: response.data?.tables?.length,
                    itemBuilder: (context, index) {
                      return TableCard(
                        table: response
                            .data!.tables![index].diningTableName!,
                        status:
                            response.data!.tables?[index].tableStatus != null
                                ? ""
                                : "",
                        onPressed: widget.onPressed
                      );
                    },
                  );
              }
              return Container();
            }));
  }

  getGridViewCount(type) {
    if (type == 1) {
      return 2;
    } else if (type == 2) {
      return 3;
    } else {
      return 4;
    }
  }
}
