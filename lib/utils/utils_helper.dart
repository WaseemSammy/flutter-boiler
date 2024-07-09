import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/utils/responsive.dart';
import 'package:my_flutter/widgets/big_text.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../models/clients/object_type_response.dart';
import '../widgets/big_text_center.dart';


class Utils{
  Utils._();
  static final intence = Utils._();



  Future<Map<String,dynamic>>segregateSubscribed(List<ObjectData>? mainList,List<ObjectData> subscribe,List<ObjectData> unsubscribe) async {
    if(mainList!=null) {
      for (var element in mainList) {
        if (element.isSubscribed == true) {
          subscribe.add(element);
        } else {
          unsubscribe.add(element);
        }
      }
    }

    return{"sub":subscribe,"unsub":unsubscribe } ;
  }
  String getAlphaNameAlphabet(String? fname,String? lastName){
    var forw = fname?.substring(0,1)??"";
    var last = lastName?.substring(0,1)??"";
    return forw+last;
  }

  Color getTableBackgroundColor(type){
    switch(type){
      case 1 :
        return Colors.orangeAccent;
      case 2 :
        return Colors.green;
      case 3 :
        return Colors.grey.shade300;

      default :
        return Colors.white;
    }
  }
  Color getTextAndIconColor(type){
    switch(type){
      case 1 :
        return Colors.white;
      case 2 :
        return Colors.white;
      case 3 :
        return Colors.black;

      default :
        return Colors.white;
    }
  }

  void showCustomerDialog(BuildContext ctx,  Function selectPerson){
   showDialog(context: ctx, builder: (BuildContext context){
     
      return Responsive(
         mobile: getWidget(1,context,selectPerson),
         tablet: getWidget(2,context,selectPerson),
         desktop: getWidget(3,context,selectPerson),
       );
   });
  }

  Widget getWidget(type,BuildContext ctx,  Function selectPerson){
    int selectedCard = -1;
    return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))

              ),
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BigText(text: "Select Customer",
                          color: CupertinoColors.black,
                          size: 20,),
                      ),
                      SizedBox(
                        height: (type == 1) ? MediaQuery
                            .of(ctx)
                            .size
                            .height / 3 : MediaQuery
                            .of(ctx)
                            .size
                            .height / 2,
                        child: MediaQuery.removePadding(
                          removeBottom: true,
                          context: ctx,
                          child: GridView.count(
                              crossAxisCount: (type == 1) ? 5 : 10,
                              shrinkWrap: true,
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              children: List.generate(20, (index) {
                                return Container(
                                  margin: const EdgeInsets.all(6),
                                  child: InkWell(
                                    onTap: () =>
                                    {
                                     // selectPerson(index + 1)
                                      setState((){
                                       // print(selectedCard);
                                        selectedCard = index;
                                        //print(selectedCard);
                                      })
                                    },
                                    child: Card(
                                      elevation: 2,
                                      color: (selectedCard == index) ? Colors.black : Colors.white,
                                      child: Center(
                                        child: BigText(text: "${index+1}",color: (selectedCard == index) ? Colors.white : Colors.black, size: 20,)
                                      ),
                                    ),
                                  ),
                                );
                              },
                              )
                          ),
                        ),),
                      InkWell(
                        onTap: ()=>{
                          if(selectedCard!=-1){
                            selectPerson(selectedCard + 1),

                          }else{
                            Get.snackbar("Customer Selection", "Please select customer count",colorText: Colors.white,backgroundColor: Colors.red)
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            color: Colors.black,
                          ),
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          child: BigTextCenter(
                            text: "Next", color: Colors.white, size: 20,),),
                      ),
                    ]),
              ),
            ),
          );

        }
    );
  }

  bool itemAddValidaion(int count , int type){
    print("$count $type");
     if(count>0 && type>0){
       return true;
     }else{
       return false;
     }
  }

  Widget getWidgetWthResponsive(Widget widget){
    return ResponsiveBreakpoints(breakpoints: const [
      Breakpoint(start: 0, end: 480, name: MOBILE),
      Breakpoint(start: 481, end: 1200, name: TABLET),
      Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
    ], child: widget);

  }
}