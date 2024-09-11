import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/routes.dart';


class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/images/mydesqlogo.png'),
      ),
    );
  }


  @override
  void initState() {

    super.initState();
    Timer(
        const Duration(seconds: 3),
            () async => Get.offAndToNamed(RouteClass.getLoginScreen())
            );
  }
}