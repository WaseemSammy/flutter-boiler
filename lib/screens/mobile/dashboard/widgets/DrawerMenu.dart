import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:my_flutter/constants/app_constants.dart';
import 'package:my_flutter/widgets/big_text.dart';


class DrawerMenu extends StatelessWidget {

   const DrawerMenu({Key? key, required this.callback}) : super(key: key);
   final Function callback;

  @override
  Widget build(BuildContext context) {
    return GFDrawer(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/left_menu_blur_img_new_bg.png"),
                fit: BoxFit.cover)),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 200,
              color: Colors.white,
              child: Image.asset("assets/images/mydesq.png",scale: 1.0,),
            ),
            ListTile(
                title: Wrap(
                    alignment: WrapAlignment.start,
                    children: [

                  const Icon(
                    Icons.file_copy_outlined,
                    color: Colors.black54,
                    size: 15.0,
                  ),
                  const SizedBox(width: 10,),
                  BigText(text: "Clients",color: Colors.white,size: 15,)
                ]),
                onTap: () {
                  Get.back();

                  callback(0,AppConstants.Clients);
                }),
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            ListTile(
              title: const Text("Portfolios"),
              onTap: (){
                Get.back();
                callback(1,AppConstants.Consolidations);
              },
            ),
            const ListTile(
              title: Text("Accounts"),
            ),
          ],
        ),
      ),
    );
  }
}
