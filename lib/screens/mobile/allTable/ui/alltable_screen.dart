

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/api/Status.dart';
import 'package:my_flutter/constants/app_constants.dart';
import 'package:my_flutter/constants/color_constants.dart';
import 'package:my_flutter/constants/dummyJson.dart';
import 'package:my_flutter/models/all_table_response.dart';
import 'package:my_flutter/models/dashboard_response.dart';
import 'package:my_flutter/screens/mobile/allTable/alltable_view_model.dart';
import 'package:my_flutter/utils/responsive.dart';
import 'package:my_flutter/utils/shared_preferences_helper.dart';
import 'package:my_flutter/widgets/big_text.dart';
import 'package:my_flutter/widgets/small_text.dart';


import '../../common/common_app_bar.dart';
import '../widgets/running_items.dart';

class AllTableScreen extends StatefulWidget {
  const AllTableScreen({Key? key}) : super(key: key);

  @override
  State<AllTableScreen> createState() => _RunningOrdersState();
}

class _RunningOrdersState extends State<AllTableScreen> {
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
    _viewModel.getAllTableData(context, 1);
  //  getAreas();
  }
  @override
  Widget build(BuildContext context) {

    return  Responsive(
        mobile: getWidget(1),
        tablet: getWidget(2),
        desktop: getWidget(3)
    );
  }

  Widget getWidget(type){
    final w = (MediaQuery.of(context).size.width - runSpacing * (columns - 30)) / columns;
    return  Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50), child: CommonAppBar("TABLES",true),
      ),
      body: GetBuilder<AllTableViewModel>(
          init: AllTableViewModel(),
          builder: (viewModel) {
            switch(viewModel.allTableResponse.status){
              case Status.LOADING :
                return Container();

              case Status.COMPLETED :
                AllTableResponse response = viewModel.allTableResponse.data as AllTableResponse;
                return Container(
                    color: ColorConstants.AppBackgroundColor,
                    child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,

                              child: Wrap(
                                  runSpacing: runSpacing,
                                  spacing: spacing,
                                  alignment: WrapAlignment.center,
                                  children: List.generate(response.data?.areas?.length??0, (index) {
                                    return InkWell(
                                      onTap: (){
                                        setState(() {
                                          selectedIndex = index;
                                        });

                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        width: w,
                                        decoration: BoxDecoration(
                                            color: selectedIndex==index?Colors.black : Colors.transparent,
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(color: Colors.black)),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: SmallText(text: "${response.data?.areas?[index].areaName}",
                                            color: selectedIndex==index?Colors.white : Colors.black,
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                              ),
                            ),
                            Expanded(
                              child: DefaultTabController(
                                initialIndex: 0,
                                length: 3,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    /* Container(
                          width: double.infinity,
                          child: ButtonsTabBar(
                              center: false,
                              contentPadding: EdgeInsets.all(10),
                              backgroundColor: Colors.orangeAccent,
                              radius: 20,
                              unselectedBackgroundColor: Colors.white,
                              unselectedLabelStyle: const TextStyle(color: Colors.grey),
                              labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              tabs: [
                                Tab(
                                  icon: const ImageIcon(
                                      AssetImage('assets/icons/dining.png')
                                  ),
                                  text: "Ground",
                                ),
                                Tab(
                                  icon: const ImageIcon(
                                      AssetImage('assets/icons/dining.png')
                                  ),
                                  text: "Floor 1",
                                ),Tab(
                                  text: "Floor 2",
                                )
                              ]),
                        ),*/
                                    Expanded(
                                      child: TabBarView(
                                          children: [
                                            GridView.count(crossAxisCount: getGridViewCount(type),
                                                mainAxisSpacing: 5.0,
                                                crossAxisSpacing: 5.0,
                                                shrinkWrap: true,
                                                children:response.data?.tables?.map((e) => RunningGridItems(e)).toList()??[]),
                                            GridView.count(crossAxisCount: getGridViewCount(type),
                                                mainAxisSpacing: 5.0,
                                                crossAxisSpacing: 5.0,
                                                shrinkWrap: true,
                                                children:response.data?.tables?.map((e) => RunningGridItems(e)).toList()??[]),
                                            GridView.count(crossAxisCount: getGridViewCount(type),
                                                mainAxisSpacing: 5.0,
                                                crossAxisSpacing: 5.0,
                                                shrinkWrap: true,
                                                children:response.data?.tables?.map((e) => RunningGridItems(e)).toList()??[])
                                          ]
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                    )
                );

            }
            return Container();
          })
    );





  }

  void getAreas() async {
    var data = await SharedPreferencesHelper.getValue(AppConstants.KEY_AREA);
    setState(() {
      var my =jsonDecode(data!);
     // area = my.map<Areas>((dynamic e) => Areas.fromJson(e as Map<String,dynamic>)).toList();

    });


  }

  getGridViewCount(type){
    if(type == 1){
      return 3;
    }else if(type == 2){
      return 4;
    }else{
      return 6;
    }

  }
}
