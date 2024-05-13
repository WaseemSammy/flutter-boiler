import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/routes/routes.dart';

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
        padding: const EdgeInsets.all(5),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
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
                            ? const Color(0xFF077bd7)
                            : const Color(0xFF077bd7),
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[0],
                    child: Container(
                      height: 2,
                      width: 20,
                      color: const Color(0xFF051441),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 20),
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
                            ? const Color(0xFF077bd7)
                            : const Color(0xFF077bd7),
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[1],
                    child: Container(
                      height: 2,
                      width: 20,
                      color: const Color(0xFF051441),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 20),
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
                            ? const Color(0xFF077bd7)
                            : const Color(0xFF077bd7),
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[2],
                    child: Container(
                      height: 2,
                      width: 20,
                      color: const Color(0xFF051441),
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
