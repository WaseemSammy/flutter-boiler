import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/models/new_cart_Items.dart';
import 'package:my_flutter/routes/routes.dart';
import 'package:my_flutter/screens/newDesign/style.dart';
import 'package:my_flutter/utils/responsive.dart';
import '../../../constants/app_colors.dart';
import '../../../models/cartItems.dart';
import '../../../screens/mobile/orders/viewmodel/table_order_viewmodel.dart';
import '../../../widgets/small_text.dart';

class WebCheckoutScreen extends StatefulWidget {
  const WebCheckoutScreen({super.key});

  @override
  State<WebCheckoutScreen> createState() => _WebCheckoutScreenState();
}

class _WebCheckoutScreenState extends State<WebCheckoutScreen> {
  final _viewModel  = Get.put(TableOrderViewModel());
  int? ref = 0;



  @override
  void initState() {

    _viewModel.getCartData();
    super.initState();
  }

  void add(Orders cartItem ,int tableItem,String portionType){
    _viewModel.add(cartItem, tableItem, portionType);
  }

  void remove(String itemName,String portionType){
    _viewModel.removeFromCart(itemName, portionType);
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
      appBar: Responsive.isMobile(context) ? AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
             Get.back();
            });
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ) : null,
      body: Container(
          color: AppColors.white,
          child: GetBuilder<TableOrderViewModel>(
              init: TableOrderViewModel(),
              builder: (viewmodel){
                return getView(viewmodel);
              }
          )

      ),

    );
  }
  Widget getView(TableOrderViewModel viewmodel){
   return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child :  ListView.separated(
                shrinkWrap: true,
                itemCount:viewmodel.cartItemData.length??0,

                itemBuilder: (context, index) {
                  return buildCartItem(viewmodel.cartItemData[index],add,remove);
                },
              separatorBuilder: (BuildContext context, int index) {
                return  const DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: Colors.black,
                    dashRadius: 0.0,
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 0.0,
                  );
              },
            ),
            /*child: ListView(
              children: <Widget>[
                buildCartItem('Fried Chicken With Omlete', '1 x pepsi', 2, 45),
                buildCartItem('Sushi With Salmon & Wasabi (Small)', '', 2, 110.10),
                buildCartItem('Min Lamonade (30ml)', '', 2, 20),
              ],
            ),*/
          ),
          buildSummarySection(context),
        ],
      ),
    );
  }
  Widget buildCartItem(NewCartItems? cartItem, Function add
  , Function remove) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 PrimaryText(text: '${cartItem?.itemName} ( ${cartItem?.ItemType} )',size: 14,),
                 Padding(
                   padding: const EdgeInsets.only(top: 5),
                   child: Wrap(
                     spacing: 7,
                     crossAxisAlignment: WrapCrossAlignment
                         .center,
                     children: [
                       InkWell(
                         onTap: () {
                         remove(cartItem?.itemName,cartItem?.ItemType);
                         },
                         child: const CircleAvatar(
                           maxRadius: 10,
                           backgroundColor: Colors.black,
                           child: Icon(Icons.remove,
                             color: Colors.white,
                             size: 15,),
                         ),
                       ),
                       PrimaryText(text: "${cartItem?.quantity}",size: 14),
                       InkWell(
                         onTap: () {
                           print("${cartItem?.quantity??1}");
                           int qty = cartItem?.quantity??1;
                           qty+=1;
                           String? type = cartItem?.ItemType;
                           add(Orders(itemId: cartItem?.itemId,itemName: cartItem?.itemName), qty,type);
                         },
                         child: const CircleAvatar(
                           maxRadius: 10,
                           backgroundColor: Colors.black,
                           child: Icon(Icons.add,
                             color: Colors.white,
                             size: 15,),
                         ),
                       )
                     ],),
                 )
               ],
             ),
              Align(
               alignment: Alignment.topRight,
                 child: PrimaryText(text: "${getTotal(cartItem)?.toStringAsFixed(2)}",size: 14)),
           ],
         ),
        ],
      ),
    );
  }
  Widget buildSummarySection(BuildContext context) {
    double subtotal = 550;
    double discount = 30.20;
    double tax = 50;
    double total = subtotal - discount + tax;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildSummaryRow('Subtotal:', '\$${subtotal.toStringAsFixed(2)}'),
          buildSummaryRow('Coupon Discount:', '\$0.00'),
          buildSummaryRow('Discount:', '- \$${discount.toStringAsFixed(2)}'),
          buildSummaryRow('VAT/TAX:', '+ \$${tax.toStringAsFixed(2)}'),
          const Divider(),
          buildSummaryRow('Total:', '\$${total.toStringAsFixed(2)}', isTotal: true),
          const SizedBox(height: 20),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  height: 25,
                  padding: EdgeInsets.all(2),
                    color: AppColors.PrimaryAssentColor,
                    child: const Align(
                        alignment: Alignment.center,child: PrimaryText(text: "KOT",size: 14,color: AppColors.white,))
                ),
              ),
              Expanded(
                child: Container(
                    height: 25,
                    padding: EdgeInsets.all(2),
                    color: Colors.deepPurple,
                    child: const Align(
                        alignment: Alignment.center,
                        child: PrimaryText(text: "Place Order",size: 14,color: AppColors.white,))
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SmallText(
            text:
            label,

          ),
          SmallText(
            text:
            value,

          ),
        ],
      ),
    );
  }
  double? getPrice(NewCartItems? cartItemData){
    return cartItemData?.ItemType == "Half" ? cartItemData?.priceHalf: cartItemData?.priceFull;
  }
  double? getTotal(NewCartItems? cartItemData){
    if(cartItemData?.ItemType == "Half") {
      var price = cartItemData?.priceHalf??0.0;
      var qty = cartItemData?.quantity??1;
      return  price * qty ;
    } else{
      var price = cartItemData!.priceFull??0.0;
      var qty = cartItemData.quantity??1;
      return  price * qty ;
    }
  }
}
