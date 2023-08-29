

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:info_popup/info_popup.dart';
import 'package:my_flutter/constants/app_colors.dart';
import 'package:my_flutter/models/clients/object_type_response.dart';
import 'package:my_flutter/screens/dashboard/widgets/watch_list_item.dart';
import 'package:string_to_color/string_to_color.dart';
import 'package:string_to_color/string_to_color.dart';
import '../../../constants/my_globals.dart' as global;
import '../../../widgets/big_text.dart';
class DashboardAppBar extends StatefulWidget implements PreferredSizeWidget {
 final bool arrowEnabled;
 final List<ObjectData> subsrcibe;

  const DashboardAppBar({Key? key,required this.arrowEnabled,required this.subsrcibe}) : super(key: key);


  @override
  State<DashboardAppBar> createState() => _DashboardAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _DashboardAppBarState extends State<DashboardAppBar> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //print(color);
  @override
  Widget build(BuildContext context) {
    print(AppColors.hexToColor(global.bgColor!));
    return  GFAppBar(
      centerTitle: true,
      brightness: Brightness.dark,
      title: Wrap(children: [
        BigText(text: "All Clients",color: Colors.white,
        size: 20,),
        Visibility(
           visible: widget.arrowEnabled,
            child: InfoPopupWidget(
              customContent:  Container(
                padding: EdgeInsets.zero,
                height: 200,
                color: Colors.white,
                child: SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: widget.subsrcibe.length,
                    itemBuilder: (context, index) {
                    return WatchListItem();
                  },),
                ),
              ),
                arrowTheme: InfoPopupArrowTheme(
                color: Colors.white
              ),
                contentOffset: Offset.zero,

                child: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,)))
      ]),
      backgroundColor: AppColors.hexToColor(global.bgColor!),
      iconTheme: IconThemeData(
        color: Colors.white
      ),
    );
  }
}
