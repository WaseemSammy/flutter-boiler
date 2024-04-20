import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';

class LoaderWidget {
  static OverlayEntry? _overlayEntry;
  static bool _onScreen = false;

  static bool isLoaderOn() => _onScreen;

  static void showLoader(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());

    hideLoader(context);

    _overlayEntry = createOverlayEntry(context);
    Overlay.of(context).insert(_overlayEntry!);
    _onScreen = true;
  }

  static void hideLoader(BuildContext context) {
    if (_onScreen) {
      _overlayEntry?.remove();
      _onScreen = false;
    }
  }

  //Loader can be changed from here
  static OverlayEntry createOverlayEntry(BuildContext context) {
    return OverlayEntry(
        builder: (context) =>  Center(
          child: Container(
      height: 70,
      width: 70,decoration: const BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10))),
      child :  const GFLoader(type: GFLoaderType.ios),),
        ));
  }
}
