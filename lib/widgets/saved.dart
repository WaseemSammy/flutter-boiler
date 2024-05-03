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
          return SafeArea(
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(50), child: CommonAppBar(),
              ),
              body: Container(
                color: ColorConstants.AppBackgroundColor,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: BigText(text: "Make New Order",color: Colors.white,size: 20,),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            spacing: 10,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Image.asset("assets/icons/dining.png",width: 50,height: 50,),
                              BigText(text: "Running Orders",
                                size: 20,)
                            ],),
                          GestureDetector(
                            onTap: ()=> Get.toNamed(RouteClass.getRunningOrders()),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellowAccent[200],
                              ),
                              child: BigText(text: "5",size: 20,),
                            ),
                          )

                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Container(
                      padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
                      margin: const EdgeInsets.only(left: 20,right: 20),
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            spacing: 10,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Image.asset("assets/icons/table.png",width: 50,height: 50,),
                              BigText(text: "Tables",
                                size: 20,)
                            ],),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RouteClass.getAllTable());
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellowAccent[200],
                              ),
                              child: BigText(text: "5/15",size: 20,),
                            ),
                          )

                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                    //Bottem view
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BigText(text: "Table No"),
                          BigText(text: "Starting Time"),
                          BigText(text: "Total"),
                          BigText(text: ""),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 0.5,
                    ),
                    Container(
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => const Divider(
                              color: Colors.black,
                              height: 0.5,
                            ),
                            itemCount:5,
                            itemBuilder: (context, index) => const YourOrder(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),),
            ),
          );
        });
  }
}



