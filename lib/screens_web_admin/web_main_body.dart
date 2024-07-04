import 'package:flutter/cupertino.dart';
import 'package:my_flutter/screens_web_admin/web_orders/ui/web_orders_main.dart';
import 'package:my_flutter/screens_web_admin/web_tables/ui/web_all_table.dart';

class WebMainBody extends StatefulWidget {
  final int selectedIndex;
  const WebMainBody(this.selectedIndex, {super.key});

  @override
  State<WebMainBody> createState() => _WebMainBodyState();
}

class _WebMainBodyState extends State<WebMainBody> {

  int tableMember = 0;

  void tablePerson(number){
    // print("Selected $number");
   print("$number");
   Navigator.pop(context, "");
   setState(() {
     tableMember = number;
   });
  }

  @override
  Widget build(BuildContext context) {
    if(widget.selectedIndex==0) {
      if(tableMember>0){
        return const WebOrdersMain();
      }else {
        return WebAllTable(tablePerson);
      }
    }else{
      return Container();
    }
  }
}
