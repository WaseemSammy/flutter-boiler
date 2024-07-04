import 'dart:convert';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_flutter/screens/newDesign/dashboard/web_dashboard.dart';
import 'package:my_flutter/screens_web_admin/web_tables/ui/web_table_grid.dart';

import '../../../api/Status.dart';
import '../../../constants/app_constants.dart';
import '../../../constants/color_constants.dart';
import '../../../models/all_table_response.dart';
import '../../../screens/mobile/allTable/alltable_view_model.dart';
import '../../../screens/mobile/allTable/widgets/running_items.dart';
import '../../../screens/mobile/common/common_app_bar.dart';
import '../../../utils/responsive.dart';
import '../../../utils/shared_preferences_helper.dart';
import '../../../widgets/small_text.dart';

class WebAllTable extends StatefulWidget {
  final Function selectedPerson;
   const WebAllTable( this.selectedPerson,{super.key});

  @override
  State<WebAllTable> createState() => _WebAllTableState();
}

class _WebAllTableState extends State<WebAllTable>
    with SingleTickerProviderStateMixin {
  final double runSpacing = 3;
  final double spacing = 4;
  final int listSize = 5;
  final columns = 4;

  var selectedIndex = 0;
  final AllTableViewModel _viewModel = Get.put(AllTableViewModel());

  late TabController _tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _viewModel.getAllTableData(context, 1);
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

        body: GetBuilder<AllTableViewModel>(
            init: AllTableViewModel(),
            builder: (viewModel) {
              switch (viewModel.allTableResponse.status) {
                case Status.LOADING:
                  return Container();

                case Status.COMPLETED:
                  AllTableResponse response =
                      viewModel.allTableResponse.data as AllTableResponse;
                  return Container(
                      color: ColorConstants.AppBackgroundColor,
                      child: Container(
                          child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Wrap(
                                runSpacing: runSpacing,
                                spacing: spacing,
                                alignment: WrapAlignment.center,
                                children: List.generate(
                                    response.data?.areas?.length ?? 0, (index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                        _tabController.animateTo(selectedIndex);
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      width: w,
                                      decoration: BoxDecoration(
                                          color: selectedIndex == index
                                              ? Colors.black
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: SmallText(
                                          text:
                                              "${response.data?.areas?[index].areaName}",
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                              Expanded(
                                  child: TabBarView(
                                      controller: _tabController,
                                      children: [
                                        GridView.count(
                                            crossAxisCount:
                                                getGridViewCount(type),
                                            mainAxisSpacing: 5.0,
                                            crossAxisSpacing: 5.0,
                                            shrinkWrap: true,
                                            children: response.data?.tables
                                                    ?.map((e) =>
                                                WebTableGrid(e,widget.selectedPerson))
                                                    .toList() ??
                                                []),
                                        GridView.count(
                                            crossAxisCount:
                                                getGridViewCount(type),
                                            mainAxisSpacing: 5.0,
                                            crossAxisSpacing: 5.0,
                                            shrinkWrap: true,
                                            children: response.data?.tables
                                                    ?.map((e) =>
                                                WebTableGrid(e,widget.selectedPerson))
                                                    .toList() ??
                                                []),
                                        GridView.count(
                                            crossAxisCount:
                                                getGridViewCount(type),
                                            mainAxisSpacing: 5.0,
                                            crossAxisSpacing: 5.0,
                                            shrinkWrap: true,
                                            children: response.data?.tables
                                                    ?.map((e) =>
                                                WebTableGrid(e,widget.selectedPerson))
                                                    .toList() ??
                                                [])
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ],
                      )));
              }
              return Container();
            }));
  }

  void getAreas() async {
    var data = await SharedPreferencesHelper.getValue(AppConstants.KEY_AREA);
    setState(() {
      var my = jsonDecode(data!);
      // area = my.map<Areas>((dynamic e) => Areas.fromJson(e as Map<String,dynamic>)).toList();
    });
  }

  getGridViewCount(type) {
    if (type == 1) {
      return 3;
    } else if (type == 2) {
      return 4;
    } else {
      return 6;
    }
  }
}
