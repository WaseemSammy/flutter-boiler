import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/api/Status.dart';
import 'package:my_flutter/constants/color_constants.dart';
import 'package:my_flutter/models/dashboard_response.dart';
import 'package:my_flutter/routes/routes.dart';
import 'package:my_flutter/screens/mobile/common/common_app_bar.dart';
import 'package:my_flutter/screens/mobile/dashboard/widgets/DrawerMenu.dart';
import 'package:my_flutter/screens/mobile/dashboard/widgets/list_order_type.dart';

import 'package:my_flutter/utils/responsive.dart';

import '../../../../constants/app_constants.dart';
import '../../../../widgets/big_text.dart';
import '../viewmodels/dashboard_view_model.dart';
import '../widgets/dashboard_filter.dart';
import '../widgets/dashboard_tabbar.dart';
import '../widgets/your_order.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  void onSelect(int index,String menuName){
    //print(index);
    setState(() {
      if(menuName==AppConstants.Clients) {
       // arrowEnable = true;
      }else{
       // arrowEnable = false;
      }
     // selectedIndex = index;
    });
  }

  final _viewModel  = Get.put(DashboardViewModel());
  @override
  void initState() {
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
    return SafeArea(
      child: Scaffold(

        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: (){
            Get.toNamed(RouteClass.alltable);
          },
          label: BigText(text: 'Make Order',color: Colors.white,),
          icon: const Icon(Icons.restaurant,color: Colors.white,),
        ),
        endDrawer : DrawerMenu(callback: onSelect,),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: CommonAppBar("RESTAURANT",false),
        ),
        body: GetBuilder<DashboardViewModel>(
            init: DashboardViewModel(),
            builder: (viewModel) {
              switch(viewModel.dashboardResponse.status){
                case Status.LOADING :
                  return Container();
                case Status.COMPLETED :
                  DashboardResponse response = viewModel.dashboardResponse.data as DashboardResponse;
                 return Container(
                    color: ColorConstants.AppBackgroundColor,
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),

                        Expanded(
                          child: DefaultTabController(
                            initialIndex: 0,
                            length: response.data?.orderStatus?.length??0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DashboardTabBar(response.data?.orderStatus),
                                const SizedBox(height: 20,),
                                DashboardFloorFilter(response.data?.areas),
                                const SizedBox(height: 20,),
                                Expanded(
                                  child: TabBarView(
                                      children: [
                                        ListView.builder(
                                            shrinkWrap: true,
                                            itemCount:response.data?.currentOrders?.length??0,
                                            itemBuilder: (context, index) {
                                              return ListOrders(response.data?.currentOrders?[index]);
                                            }
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
                    ),);
              }
              return Container();

            }) ,
      ),
    );




    }
  }



