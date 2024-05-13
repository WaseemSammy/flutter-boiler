import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/constants/color_constants.dart';
import 'package:my_flutter/models/running_order_response.dart';
import 'package:my_flutter/widgets/big_text.dart';
import 'package:my_flutter/widgets/big_text_center.dart';
import 'package:my_flutter/widgets/custome_bottem_sheet.dart';


import '../../common/common_app_bar.dart';
import '../../menu/ui/menu_items.dart';
import '../viewmodel/table_order_viewmodel.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}



class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {

  final _viewModel  = Get.put(TableOrderViewModel());
  int? ref = 0;

  Data? data;


  @override
  void initState() {
    data = Get.arguments;
   _viewModel.getOrdersByTableId(data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    refresh(){
      setState(() {
        if(ref==0) {
          ref = 1;
        }else{
          ref = 0;
        }
      });
    }
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CommonAppBar("DETAIL",true),
      ),
       floatingActionButton: FloatingActionButton(
           elevation: 0.0,
           backgroundColor: Colors.deepOrangeAccent,
           onPressed: (){
             showModalBottomSheet(
               context: context,
               builder: (_) => CustomeBottemSheet(data,refresh),
             ).whenComplete(() {
                refresh();
             });
           },
           child: const Icon(Icons.add)
       ),
        body: Container(
        color: ColorConstants.AppBackgroundColor,
        child: Column(
          children: [

            Container(
              padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap (
                    spacing: 5,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Image.asset("assets/icons/table.png",width: 40,height: 40,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: "Table No.", size: 16,),
                          BigText(text: "${data?.tableNo}", size: 27,),
                        ],
                      )

                    ],),
                  Wrap (
                    spacing: 5,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(Icons.people_alt_outlined,color: Colors.deepOrangeAccent,
                        size: 40,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: "Customers.", size: 16,),
                          BigText(text: "${data?.noOfPerson}", size: 27,),
                        ],
                      )

                    ],),


                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigTextCenter(text: "Items",color: Colors.black,size: 20,),
                    Obx(() {
                     return BigTextCenter(text: "Total-${_viewModel.total}", color: Colors.black, size: 20,);
                    })
                  ],
                )
            ),
              SizedBox(
                  height: 500,
                child: Obx(() {
                  return  Container(
                                  padding: const EdgeInsets.all(5),
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.zero
                                  ),
                    child : MediaQuery.removePadding(
                                  removeTop: true,
                                  context: context,
                                  child: ListView.separated(itemBuilder: (context, index) {
                                    return MenuItems(_viewModel.cartItembytable?.value.orders?[index],data,false);
                                  }, separatorBuilder: (context, index) {
                                    return const Divider(height: 0.5,color: Colors.grey,);
                                  }, itemCount: _viewModel.cartItembytable?.value.orders?.length??0)
                  ));
                }),
              )
          ],
        ),
      ),
        bottomNavigationBar: InkWell(

          child: Container(

            decoration: const BoxDecoration(
              borderRadius: BorderRadius.zero,
              color: Colors.deepOrangeAccent,
            ),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: BigTextCenter(text: "Confirm Order",color: Colors.white,size: 20,),),
        ),
    );
  }
}
