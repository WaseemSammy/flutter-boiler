
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:my_flutter/models/cartItems.dart';
import 'package:my_flutter/models/new_cart_Items.dart';


class TableOrderViewModel extends GetxController{
   List<NewCartItems?> cartItemData = [];
   Rx<CartItemData>? cartItembytable = CartItemData().obs;
   Rx<CartItemData>?  tempCartItem = CartItemData().obs;



   RxDouble? total = 0.0.obs;

   add(Orders? cartItem,int tableItem,String portionType){
     if (portionType != 'Half' && portionType != 'Full') {
       if (kDebugMode) {
         print('Invalid portion type. Please choose "Half" or "Full".');
       }
       return;
     }

     NewCartItems? newCartItems = cartItemData.firstWhereOrNull((Item)=> Item?.itemId == cartItem?.itemId && Item?.ItemType == portionType);
     if (newCartItems != null) {
       newCartItems.quantity = tableItem;
     } else {
       cartItemData.add(NewCartItems(cartItem?.itemId,cartItem?.itemName, portionType, tableItem,(cartItem?.itemPrice)!/2,cartItem?.itemPrice));
     }

     if (kDebugMode) {
       print('${cartItem?.itemName} ($portionType) added to cart.');
     }

     update();

   }

   void removeFromCart(String itemName, String portionType) {
     NewCartItems? newCartItems =  cartItemData.firstWhereOrNull(
           (item) => item?.itemName == itemName && item?.ItemType == portionType,
     );
     if (newCartItems != null) {
       if(newCartItems.quantity>1){
         newCartItems.quantity--;
       } else {
         cartItemData.removeWhere(
               (item) =>
           item?.itemName == itemName && item?.ItemType == portionType,
         );
       }
     }
     else {
       cartItemData.removeWhere(
             (item) => item?.itemName == itemName && item?.ItemType == portionType,
       );
     }

     if (kDebugMode) {
       print('$itemName ($portionType) removed from cart.');
     }
     update();
   }

   double calculateTotalAmount() {
     double totalAmount = 0.0;
     for (var item in cartItemData) {
         if (item?.ItemType == 'Half') {
           var price = item?.priceHalf??0.0;
           var qty = item!.quantity??1;
           totalAmount +=  price * qty;
         } else if (item?.ItemType == 'Full') {
           var price = item?.priceFull??0.0;
           var qty = item!.quantity??1;
           totalAmount +=  price * qty;

         }
     }

     return totalAmount;
   }

   int getTotalCartItemCount() {
     int totalCount = 0;
     for (var item in cartItemData) {
       int qty = item?.quantity??1;
       totalCount += qty;
     }
     return totalCount;
   }

  List<NewCartItems?> getCartData(){
     return cartItemData;
  }




}