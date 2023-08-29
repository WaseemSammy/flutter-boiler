import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/models/clients/client_data_response.dart';
import 'package:my_flutter/utils/utils_helper.dart';
import 'package:my_flutter/widgets/small_text.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/my_globals.dart' as global;

class ClientListItems extends StatefulWidget {
  final Data data;
  const ClientListItems(this.data, {Key? key}) : super(key: key);

  @override
  State<ClientListItems> createState() => _ClientListItemsState();
}

class _ClientListItemsState extends State<ClientListItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.5,vertical: 6.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(backgroundColor: AppColors.hexToColor(global.bgColor!),radius: 30, child: SmallText(text: Utils.intence.getAlphaNameAlphabet(widget.data.clientFirstName, widget.data.clientLastName),color: Colors.white,size: 24,)),
          SizedBox(width: 5,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(text : widget.data.clientFullName??""),
                SmallText(text: "${widget.data.cityName},${widget.data.countryName}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SmallText(text : "Last Contact"),
                    SmallText(text: widget.data.lastContactDate??"")
                  ],
                )

              ],
            ),
          )
        ],
      ),
    );
  }


}

