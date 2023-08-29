import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LabTestWidget extends StatefulWidget {
  const LabTestWidget(this.labTestId,this.labtestlabel,this.backgroundImageUrl) ;
  final String labTestId;
  final String labtestlabel;
  final String backgroundImageUrl;


  @override
  State<LabTestWidget> createState() => _LabTestWiState();
}
class _LabTestWiState extends State<LabTestWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 150,
      child: Card(
        margin: EdgeInsets.all(5),
        child: Stack(
          children: [
           SvgPicture.asset(
              "assets/icons/login.svg",
              fit: BoxFit.fitWidth,
            ),
             Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(widget.labtestlabel),
            ),
          ],
        ),
      ),
    );
  }
}
