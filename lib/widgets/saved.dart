import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/constants/color_constants.dart';
import 'package:my_flutter/routes/routes.dart';
import 'package:my_flutter/screens/mobile/common/common_app_bar.dart';

import 'package:my_flutter/utils/responsive.dart';

import '../../../../widgets/big_text.dart';
import '../screens/mobile/dashboard/viewmodels/dashboard_view_model.dart';
import '../screens/mobile/dashboard/widgets/your_order.dart';





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
          switch(viewModel.dashboardResponse.status){
            case Status.LOADING :
              return Container();
            case Status.COMPLETED :
              DashboardResponse response = viewModel.dashboardResponse.data as DashboardResponse;
              return SafeArea(
                child: Scaffold(
                  floatingActionButton: FloatingActionButton.extended(
                    backgroundColor: Colors.black,
                    onPressed: (){
                      Get.toNamed(RouteClass.alltable);
                    },
                    label: BigText(text: 'Make Order',color: Colors.white,),
                    icon: Icon(Icons.restaurant,color: Colors.white,),
                  ),
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(50), child: CommonAppBar("RESTAURANT",false),
                  ),
                  body: ,
                ),
              );
          }
        });
  }
}



