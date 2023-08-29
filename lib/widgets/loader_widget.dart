import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';

class LoaderWidget {
  static OverlayEntry? _overlayEntry = null;
  static bool _onScreen = false;

  static bool isLoaderOn() => _onScreen;

  static void showLoader(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());

    hideLoader(context);

    _overlayEntry = createOverlayEntry(context);
    Overlay.of(context)?.insert(_overlayEntry!);
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
      width: 70,
      child :  GFLoader(type: GFLoaderType.ios),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10))),),
        ));
  }
}
