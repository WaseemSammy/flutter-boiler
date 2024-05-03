

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/constants/color_constants.dart';
import 'package:my_flutter/constants/dummyJson.dart';
import 'package:my_flutter/utils/responsive.dart';
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
  final double runSpacing = 4;
  final double spacing = 4;
  final int listSize = 5;
  final columns = 4;

  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
       appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50), child: CommonAppBar("TABLES"),
    ),
      body: Responsive(
        mobile: getWidget(1),
        tablet: getWidget(2),
        desktop: getWidget(3),
      ),
    );
  }

  Widget getWidget(type){
    final w = (MediaQuery.of(context).size.width - runSpacing * (columns - 1)) / columns;
  return  Container(
      color: ColorConstants.AppBackgroundColor,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: EdgeInsets.all(5),

        child: Column(
          children: [
          Wrap(
          runSpacing: runSpacing,
          spacing: spacing,
          alignment: WrapAlignment.center,
          children: List.generate(listSize, (index) {
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
                  child: SmallText(text: "Floor ${index+1}",
                    color: selectedIndex==index?Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          })
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
                                children:DummyJson.allTable.data?.map((e) => RunningGridItems(e)).toList()??[]),
                            GridView.count(crossAxisCount: getGridViewCount(type),
                                mainAxisSpacing: 5.0,
                                crossAxisSpacing: 5.0,
                                shrinkWrap: true,
                                children:DummyJson.allTable.data?.map((e) => RunningGridItems(e)).toList()??[]),
                            GridView.count(crossAxisCount: getGridViewCount(type),
                                mainAxisSpacing: 5.0,
                                crossAxisSpacing: 5.0,
                                shrinkWrap: true,
                                children:DummyJson.allTable.data?.map((e) => RunningGridItems(e)).toList()??[])
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
