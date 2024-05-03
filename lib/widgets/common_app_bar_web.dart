import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/routes/routes.dart';
import 'package:my_flutter/widgets/big_text.dart';

class WebAppBar extends StatefulWidget {
  const WebAppBar({super.key});

  @override
  State<WebAppBar> createState() => _WebAppBarState();
}

final List _isHovering = [
  false,
  false,
  false
];
class _WebAppBarState extends State<WebAppBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white.withOpacity(0.5),
      child: Padding(
        padding: EdgeInsets.all(5),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20),
            InkWell(
              onHover: (value) {
                setState(() {
                  value
                      ? _isHovering[0] = true
                      : _isHovering[0] = false;
                });
              },
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Home',
                    style: TextStyle(
                        color: _isHovering[0]
                            ? Color(0xFF077bd7)
                            : Color(0xFF077bd7),
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[0],
                    child: Container(
                      height: 2,
                      width: 20,
                      color: Color(0xFF051441),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onHover: (value) {
                setState(() {
                  value
                      ? _isHovering[1] = true
                      : _isHovering[1] = false;
                });
              },
              onTap: () {
                Get.toNamed(RouteClass.alltable);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Offline',
                    style: TextStyle(
                        color: _isHovering[1]
                            ? Color(0xFF077bd7)
                            : Color(0xFF077bd7),
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[1],
                    child: Container(
                      height: 2,
                      width: 20,
                      color: Color(0xFF051441),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onHover: (value) {
                setState(() {
                  value
                      ? _isHovering[2] = true
                      : _isHovering[2] = false;
                });
              },
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Online',
                    style: TextStyle(
                        color: _isHovering[2]
                            ? Color(0xFF077bd7)
                            : Color(0xFF077bd7),
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[2],
                    child: Container(
                      height: 2,
                      width: 20,
                      color: Color(0xFF051441),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),

      ),

    );
    //);
  }
}
