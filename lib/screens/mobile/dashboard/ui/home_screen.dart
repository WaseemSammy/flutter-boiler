import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/constants/color_constants.dart';
import 'package:my_flutter/routes/routes.dart';
import 'package:my_flutter/screens/mobile/common/common_app_bar.dart';

import 'package:my_flutter/utils/responsive.dart';
import 'package:my_flutter/widgets/small_text.dart';

import '../../../../widgets/big_text.dart';
import '../viewmodels/dashboard_view_model.dart';
import '../widgets/dashboard_filter.dart';
import '../widgets/dashboard_tabbar.dart';
import '../widgets/your_order.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  final _viewModel  = Get.put(DashboardViewModel());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel.getDashboardData(context, 1);
  }


  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: getUi(),
      tablet: getUi(),
      desktop: getUi()
    );

  }
  Widget getUi(){
   return GetBuilder<DashboardViewModel>(
        init: DashboardViewModel(),
        builder: (viewModel){
          return SafeArea(
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(50), child: CommonAppBar("ORDERS"),
              ),
              body: Container(
                color: ColorConstants.AppBackgroundColor,
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.toNamed(RouteClass.alltable);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: BigText(text: "Make New Order",color: Colors.white,size: 20,),
                      ),
                    ),
                    SizedBox(height: 20,),

                    Expanded(
                      child: DefaultTabController(
                        initialIndex: 0,
                        length: 3,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DashboardTabBar(),
                            SizedBox(height: 20,),
                            DashboardFloorFilter(),
                            SizedBox(height: 20,),
                            Expanded(
                              child: TabBarView(
                                  children: [
                                    ListView.separated(
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) => const Divider(
                                        color: Colors.black,
                                        height: 0.5,
                                      ),
                                      itemCount:20,
                                      itemBuilder: (context, index) => const YourOrder(),
                                    ),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) => const Divider(
                                        color: Colors.black,
                                        height: 0.5,
                                      ),
                                      itemCount:5,
                                      itemBuilder: (context, index) => const YourOrder(),
                                    ),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) => const Divider(
                                        color: Colors.black,
                                        height: 0.5,
                                      ),
                                      itemCount:5,
                                      itemBuilder: (context, index) => const YourOrder(),
                                    )
                                  ]
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),),
            ),
          );
        });
    }
  }



