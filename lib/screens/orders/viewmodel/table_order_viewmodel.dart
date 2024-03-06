import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_flutter/models/cartItems.dart';
import 'package:my_flutter/models/running_order_response.dart';


class TableOrderViewModel extends GetxController{
   List<CartItemData?> cartItemData = <CartItemData>[].obs;
   Rx<CartItemData>? cartItembytable = CartItemData().obs;
   Rx<CartItemData>?  tempCartItem = CartItemData().obs;

   @override
  void onInit() {
    super.onInit();
  }


   RxDouble? total = 0.0.obs;

   add(Orders? cartItem,Data? data){
     print(jsonEncode(cartItemData));

     List<CartItemData?> mydata = cartItemData.where((element) => element?.tableId == data?.tableId).toList();
     if(mydata.length>0) {
       bool found = false;
       int lenth= cartItemData?.length??0;
       for (var i = 0; i < lenth; i++) {
          if(cartItemData[i]?.tableId == data?.tableId){
            int orderlenght= cartItemData[i]?.orders?.length??0;
             for(var j=0;j < orderlenght;j++){
               if(cartItemData[i]?.orders?[j].itemId == cartItem?.itemId){
                 int count = cartItemData[i]?.orders?[j].count??1;
                 cartItemData[i]?.orders?[j].count = count+1;
                 found=true;
                 break;
               }
             }
             if(found){
               break;
             }else{
               cartItem?.count = 1;
               cartItemData[i]?.orders?.add(cartItem!);
               found=true;
               break;
             }
          }
       }
     }else{
       var dummycart = CartItemData();
       dummycart.tableId = data?.tableId;
       dummycart.tableName = data?.tableNo.toString();
       dummycart.orders = [];
       cartItem?.count = 1;
       dummycart.orders?.add(cartItem!);
       cartItemData.add(dummycart);
     }
     calCulateTotal(data);
     getOrdersByTableId(data);
   }

   remove(Orders? cartItem,Data? data) {
     List<CartItemData?> mydata = cartItemData.where((element) => element?.tableId == data?.tableId).toList();

     if(mydata.length>0) {
       bool found = false;
       int lenth= cartItemData?.length??0;
       for (var i = 0; i < lenth; i++) {
         if(cartItemData[i]?.tableId == data?.tableId){
           int orderlenght= cartItemData[i]?.orders?.length??0;
           for(var j=0;j < orderlenght;j++){
             if(cartItemData[i]?.orders?[j].itemId == cartItem?.itemId){
               int count = cartItemData[i]?.orders?[j]?.count??1;
               if(count>1) {
                 cartItemData[i]?.orders?[j]?.count = count - 1;
               }else if(count==1){
                 cartItemData[i]?.orders?.removeAt(j);
               }else{
                 cartItemData[i]?.orders?.removeAt(j);
               }
               found=true;
               break;
             }
           }
           if(found){
             break;
           }
         }
       }
     }
     cartItemData = mydata;
     calCulateTotal(data);
     getOrdersByTableId(data);
   }

   calCulateTotal(Data? data){
     print(jsonEncode(cartItemData));
     double? Total = 0.0;
     cartItemData.forEach((element) {
        if(element?.tableId == data?.tableId){
          if(element?.orders?.isNotEmpty==true) {
            Total =
                element?.orders?.map((item) => item!.itemPrice! * item.count!)
                    .reduce((ele1, ele2) => ele1 + ele2);
          }
        }
     });
     total?.value = Total??0.0;
   }

   getOrdersByTableId(Data? data){
     if(cartItemData.length>0) {
       CartItemData? cardItem = cartItemData.firstWhere((item) =>
       item?.tableId == data?.tableId);
       cartItembytable?.value = cardItem ?? CartItemData();
     }

   }

   getItemCountByTableIdAndItems(Data? data,int? itemId){
     if(cartItemData.length>0) {
       List<CartItemData?> mydata = cartItemData.where((element) =>
       element?.tableId == data?.tableId).toList();
       int cartCount = mydata?.length??0;
       if (cartCount > 0) {
         List<Orders>? myorders = mydata?.first?.orders?.where((element) => element?.itemId == itemId).toList();
         if(myorders?.length?.isGreaterThan(0) == true) {
           print("return ${myorders?.first.count ?? 0}");
           return myorders?.first.count ?? 0;
         }else{
            return 0;
         }
       }else{
         print("return 0");
         return 0;
       }
     }else{
       print("return 0");
       return 0;
     }
   }

   getAllOrders(){
      return cartItemData;
   }

   confirmOrders(Data? data){
     bool found = false;
     for (var index = 0; index < cartItemData.length; index++) {
       if(cartItemData[index]?.tableId == data?.tableId){
         cartItemData[index]?.orders = tempCartItem?.value.orders;
         found = true;
         break;
       }
     }

     if(!found){
       var dummycart = CartItemData();
       dummycart.tableId = data?.tableId;
       dummycart.tableName = data?.tableNo.toString();
       dummycart.orders = [];
       dummycart.orders = tempCartItem?.value.orders;
       cartItemData.add(dummycart);
     }



   }
}